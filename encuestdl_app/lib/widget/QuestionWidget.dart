import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:encuestdl_app/model/Question.dart';

class QuestionWidget extends StatefulWidget {
  Question question;
  Future<bool> futureQuestionAnswered;

  QuestionWidget.withFuture(Question question, Future<bool> future) {
    this.question = question;
    this.futureQuestionAnswered = future;
  }
  QuestionWidget(Question question) {
    this.question = question;
  }

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState(question);
}

class _QuestionWidgetState extends State<QuestionWidget> {
  Question _question;
  String _selectedAnswer;
  Future<bool> futureQuestionAnswered;

  _QuestionWidgetState.withFuture(Question question, Future<bool> future) {
    this._question = question;
    this.futureQuestionAnswered = future;
  }

  _QuestionWidgetState(Question question) {
    this._question = question;
  }

   void _updateSelected(String selected) {
     setState(() {
       _selectedAnswer = selected;
     });
   }

   void _confirmQuestion(){

   }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Question
        Container(
          height: 120,
          child: Center(
            child: Text("${_question.value}",
                textAlign: TextAlign.center, textScaleFactor: 1.5),
          ),
        ),

        //Opciones
        Container(
          child: Column(
            children: <Widget>[
               for (String option in _question.options)
                 ListTile(
                   title: Text(option),
                   leading: Radio(
                     value: option,
                     groupValue: _selectedAnswer,
                     onChanged: _updateSelected,
                   ),
                 ),
              // TODO: Aca hay que meter el future builder
              RaisedButton(
                onPressed: _confirmQuestion,
                child: Text('Confirmar', style: TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
