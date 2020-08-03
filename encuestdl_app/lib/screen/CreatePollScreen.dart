import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:encuestdl_app/widget/PollDataWidget.dart';
import 'package:encuestdl_app/widget/NewQuestionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePollScreen extends StatefulWidget {
  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  PollDataWidget _pollName = PollDataWidget();
  NewQuestionWidget _questions = NewQuestionWidget();

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Crear encuesta",
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          _questions.addNewQuestion(),
        },
        backgroundColor: Constants.primaryGrey,
        child: const Icon(Icons.arrow_right),
      ),
      child: ListView(
        children: <Widget>[
          _pollName,
          _questions,
          RaisedButton(
            child: Text(
              "Finalizar",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueGrey[700],
            onPressed: () {
              if(_pollName.textIsEmpty())
                _noNameShowDialog();
              else if(_questions.noQuestions() || _questions.noOneQuestionFull())
                _noQuestionsShowDialog();
              else if(_questions.questionsWithCorrectOptionError())
                _questionsWithCorrectOptionErrorShowDialog();
              else
                _finishShowDialog(context);
                //TODO ACA DEBERIAMOS GUARDAS LAS PREGUNTAS VALIDAS Y MANDAR AL SERVIDOR
            },
          ),
        ],
      ),
    );
  }

  Future _noNameShowDialog(){
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

  Future _questionsWithCorrectOptionErrorShowDialog(){
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hay preguntas en las cual no has marcado su opción correcta'),
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

  Future _noQuestionsShowDialog(){
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
}
