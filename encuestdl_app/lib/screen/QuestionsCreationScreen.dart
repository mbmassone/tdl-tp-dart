import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:encuestdl_app/screen/PollCreationFinishScreen.dart';
import 'package:encuestdl_app/widget/EmptyQuestionsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/NewQuestionWidget.dart';
import '../widget/NewQuestionWidget.dart';

class QuestionsCreationScreen extends StatefulWidget {
  int numPregunta;

  @override
  State<QuestionsCreationScreen> createState() =>
      _QuestionsCreationScreenState(numPregunta);

  QuestionsCreationScreen(int numPregunta) {
    this.numPregunta = numPregunta;
  }
}

class _QuestionsCreationScreenState extends State<QuestionsCreationScreen> {
  int numPregunta;

  _QuestionsCreationScreenState(int numPregunta) {
    this.numPregunta = numPregunta;
  }

  @override
  Widget build(BuildContext context) {
    EmptyQuestionsWidget _newQuestions = EmptyQuestionsWidget();
    
    return ScreenTemplate(
      title: "Agregar preguntas",
      child: ListView(
        children: <Widget>[
          _newQuestions,

    
          RaisedButton(
            child: Text(
              "Finalizar",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueGrey[700],
            onPressed: () => {
            
            },
          ),  
        ],
      ),
    );
  }
}
