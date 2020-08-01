import 'package:encuestdl_app/model/Question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  Question question;
  Future<bool> futureQuestionAnswered;
  final ValueChanged<int> submitAction;

  QuestionWidget.withFuture(
      Question question, Future<bool> future, this.submitAction) {
    this.question = question;
    this.futureQuestionAnswered = future;
  }

  QuestionWidget(Question question, this.submitAction) {
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

  void _submit() {
    if (_selectedAnswer != null) {
      widget.submitAction(_question.options.indexOf(_selectedAnswer));
    }
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
                    //EL METODO _handleOnPressed se implementa en el padre :D!
                    groupValue: _selectedAnswer,
                    onChanged: _updateSelected,
                  ),
                ),
              RaisedButton(
                onPressed: _submit,
                child: Text('Confirmar', style: TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
