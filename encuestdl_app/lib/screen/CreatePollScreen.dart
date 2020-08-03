import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:encuestdl_app/widget/IndividualQuestionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePollScreen extends StatefulWidget {
  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  TextEditingController _namePollController = TextEditingController();
  List<IndividualQuestionWidget> _list = List();

  _CreatePollScreenState(){
    this._list.add(IndividualQuestionWidget(_list.length + 1));
  }
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Crear encuesta",
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey[700],
        child: const Icon(Icons.live_help),
        onPressed: () => {
          _addNewQuestion(),
        },
      ),
      child: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Text(
                      "Ingrese el nombre de la encuesta:",
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                TextField(
                  controller: _namePollController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre de encuesta',
                  ),
                ),
                Card(
                  color: Colors.blueGrey[700],
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                            top: 35, bottom: 15, right: 0, left: 0),
                        child: Text(
                          "Preguntas",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.3,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      for (var i in _list) i,
                      RaisedButton(
                        child: Text(
                          "Finalizar",
                          style: TextStyle(color: Colors.blueGrey[700]),
                          textScaleFactor: 1.3,
                        ),
                        color: Colors.white,
                        onPressed: () {
                          if (_namePollController.text.isEmpty)
                            _noNameShowDialog();
                          else if (_noQuestions() || _noOneQuestionFull())
                            _noQuestionsShowDialog();
                          else if (_questionsWithCorrectOptionError())
                            _questionsWithCorrectOptionErrorShowDialog();
                          else
                            _finishShowDialog(context);
                          //TODO ACA DEBERIAMOS GUARDAS LAS PREGUNTAS VALIDAS Y MANDAR AL SERVIDOR
                        },
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

  Future _noNameShowDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Debes ponerle un nombre a tu encuesta'),
        content: RaisedButton(
          child: Text(
            "Volver",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
      ),
    );
  }

  Future _questionsWithCorrectOptionErrorShowDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
            Text('Hay preguntas en las cual no has marcado su opción correcta'),
        content: RaisedButton(
          child: Text(
            "Volver",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
      ),
    );
  }

  Future _noQuestionsShowDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('La encuesta debe tener al menos una pregunta completa'),
        content: RaisedButton(
          child: Text(
            "Volver",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
      ),
    );
  }

  Future _finishShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('¡Encuesta creada correctamente!'),
        content: RaisedButton(
          child: Text(
            "Volver a pantalla de inicio",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () => {
            Navigator.pop(context), //TODO acomodar esto
            Navigator.pop(context),
          },
        ),
      ),
    );
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
          .individualQuestionsWithCorrectOptionError()) returnValue = true;

    return returnValue;
  }

  void _addNewQuestion() {
    _list.add(IndividualQuestionWidget(_list.length + 1));
    setState(() {});
  }
}