import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:encuestdl_app/widget/NewQuestionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Constants.primaryGrey,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Constants.primaryGrey,
            label: "Agregar otra pregunta",
            onTap: () {
              if (_allQuestionFull())
                _addNewQuestion();
              else
                _showDialogTemplate(
                    "Las preguntas actuales deben estar completas para agregar una nueva",
                    "Ok");
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.restore_from_trash),
            backgroundColor: Constants.primaryGrey,
            label: "Eliminar última pregunta",
            onTap: () {
              if (_list.length != 1) _removeLastQuestion();
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.settings_backup_restore),
            backgroundColor: Constants.primaryGrey,
            label: "Volver al inicio",
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          SpeedDialChild(
              child: Icon(Icons.check),
              backgroundColor: Constants.primaryGrey,
              label: "Finalizar encuesta",
              onTap: () {
                if (_namePollController.text.isEmpty)
                  _showDialogTemplate(
                      "Debes ponerle un nombre a tu encuesta", "Ok");
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
                  Navigator.pop(context);
                  _showDialogTemplate("¡Encuesta creada correctamente!",
                      "Ok");
                }
                //TODO ACA DEBERIAMOS GUARDAS LAS PREGUNTAS VALIDAS Y MANDAR AL SERVIDOR
              }),
        ],
      ),
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

  void _addNewQuestion() {
    _list.add(NewQuestionWidget(_list.length + 1));
    setState(() {});
  }

  void _removeLastQuestion() {
    _list.removeLast();
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
