import 'dart:convert';

import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/model/Submit.dart';
import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:encuestdl_app/widget/NewQuestionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreatePollScreen extends StatefulWidget {
  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  TextEditingController _namePollController = TextEditingController();
  List<NewQuestionWidget> _list = List();

  _CreatePollScreenState() {
    this._list.add(NewQuestionWidget(_list.length + 1));
  }
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Crear encuesta",
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Constants.primaryGrey,
          onPressed: () {
            if (_allQuestionFull())
              _addNewQuestion();
            else
              _showDialogTemplate(
                  "Las preguntas actuales deben estar completas para agregar una nueva",
                  "Ok");
          }),
      child: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Center(
                    child: Text(
                      "Ingrese el nombre de la encuesta:",
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: TextField(
                    controller: _namePollController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre de encuesta',
                    ),
                  ),
                ),
                Card(
                  color: Constants.primaryGrey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                            top: 20, bottom: 15, right: 0, left: 0),
                        child: Text(
                          "Preguntas",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.3,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      for (var i in _list) i,
                      Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                            color: Colors.white,
                            child: Text(
                              "Finalizar",
                              textScaleFactor: 1.3,
                              style: TextStyle(color: Constants.primaryGrey),
                            ),
                            onPressed: () async {
                              if (_namePollController.text.isEmpty)
                                _showDialogTemplate(
                                    "Debes ponerle un nombre a tu encuesta",
                                    "Ok");
                              else if (_noQuestions() || _noOneQuestionFull())
                                _showDialogTemplate(
                                    "La encuesta debe tener al menos una pregunta completa",
                                    "Ok");
                              else if (_questionsWithCorrectOptionError())
                                _showDialogTemplate(
                                    "Hay preguntas en las cual no has marcado su opción correcta",
                                    "Ok");
                              else if (!_allQuestionFull())
                                _showDialogTemplate(
                                    "Todas las preguntas deben estar completas para crear la encuesta",
                                    "Ok");
                              else {
                                //TODO ACA DEBERIAMOS GUARDAS LAS PREGUNTAS Y MANDAR AL SERVIDOR Y MOSTRARLE EL ID AL USUARIO
                                await _createNewPoll();
                                Navigator.pop(context);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _createNewPoll() async {
    //////////////////////////ZONA DE PRUEBA//////////////////////////////////////////////////////
    
    //final response = await http.post(Constants.baseUrl + '/polls',  body: {"name": _namePollController.text});
    final createPollResponse = await http.get(Constants.baseUrl + '/poll/3');

    if (createPollResponse.statusCode == 200) {
      String id = _getId(createPollResponse.body);
      //_uploadQuestions(id);
      
      int correctOption = 1;
      List<String> options = ["si", "no", "tal vez", "absolutamente"]; 
      
      final addOptionResponse = await http.post(Constants.baseUrl + '/questions', body: json.encode({
        "value": "Pregunta",
        "options": options,
        "correct": correctOption.toString(),
        "poll": "3"
      }));

      print(addOptionResponse.statusCode);

      //////////////////////////////////////////////////////////////////////////////
      return _showDialogTemplate(
          "¡Encuesta creada correctamente!\n\n ID: $id", "Ok");
    } else
      return _showDialogTemplate("¡Error al crear la encuesta", "Ok");
  }

  String _getId(String body) {
    int i = 6;
    String aux = '';
    while (body[i] != ',') {
      aux = aux + body[i];
      i++;
    }
    return aux;
  }

  _uploadQuestions(String id) async {
    for (var i in _list)
      await http.post(Constants.baseUrl + '/questions', body: {
        "value": i.getQuestion(),
        "options": i.getOptions(),
        "correct": (i.getCorrectOption()).toString(),
        "poll": id
      });
  }

  void _addNewQuestion() {
    _list.add(NewQuestionWidget(_list.length + 1));
    setState(() {});
  }

  bool _allQuestionFull() {
    int questionsFull = 0;

    for (var i in _list) if (i.questionAndTwoOptionsFull()) questionsFull++;

    return (_list.length == questionsFull);
  }

  bool _noQuestions() {
    return (_list.length == 0);
  }

  bool _noOneQuestionFull() {
    bool returnValue = true;

    for (var i in _list) if (i.questionAndTwoOptionsFull()) returnValue = false;

    return returnValue;
  }

  bool _questionsWithCorrectOptionError() {
    bool returnValue = false;

    for (var i in _list)
      if (i.questionAndTwoOptionsFull()) if (i
          .questionsWithCorrectOptionError()) returnValue = true;

    return returnValue;
  }

  Future _showDialogTemplate(String dialogMessage, String buttonMessage) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("$dialogMessage"),
        content: RaisedButton(
          child: Text(
            "$buttonMessage",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
      ),
    );
  }
}
