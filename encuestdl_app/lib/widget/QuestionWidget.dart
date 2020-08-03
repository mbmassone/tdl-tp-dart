import 'dart:convert';

import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/model/Question.dart';
import 'package:encuestdl_app/model/Submit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuestionWidget extends StatefulWidget {
  final Question question;
  final Submit submit;
  final Function() notifyAnswered;

  QuestionWidget(
      {Key key,
      @required this.notifyAnswered,
      @required this.question,
      @required this.submit})
      : super(key: key);

  @override
  State<QuestionWidget> createState() => QuestionWidgetState(question, submit);
}

class QuestionWidgetState extends State<QuestionWidget> {
  Question _question;
  Submit _submit;
  bool _correct;
  int _selected;
  bool _answered = false;

  Future<bool> _futureCorrect;

  QuestionWidgetState(Question question, Submit submit) {
    this._question = question;
    this._submit = submit;
  }

  void onAnswer(int index) {
    setState(() {
      _answered = true;
      _selected = index;
      _futureCorrect = _checkAnswer(index + 1);
    });
  }

  void updateQuestion(Question question) {
    setState(() {
      _question = question;
      _selected = null;
      _correct = null;
      _futureCorrect = null;
      _answered = false;
    });
  }

  Future<bool> _checkAnswer(int id) async {
    final response = await http.patch(
        Constants.baseUrl + '/submit/${_submit.id}',
        body: {"response": (id).toString()});

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        _correct = jsonResponse["correct"];
      });

      widget.notifyAnswered();
      return _correct;
    } else {
      throw Exception('Failed to check answer');
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
              _answered
                  ? FutureBuilder<bool>(
                      future: _futureCorrect,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: <Widget>[
                              for (var i = 0; i < _question.options.length; i++)
                                AnswerWidget(
                                  option: _question.options[i],
                                  index: i,
                                  correct: _correct,
                                  selected: (i == _selected),
                                  answered: _answered,
                                )
                            ],
                          );
                        } else
                          return Container(
                              child:
                                  Center(child: CircularProgressIndicator()));
                      },
                    )
                  : Column(children: <Widget>[
                      for (var i = 0; i < _question.options.length; i++)
                        AnswerWidget(
                            option: _question.options[i],
                            index: i,
                            onAnswer: onAnswer)
                    ])
            ],
          ),
        ),
      ],
    );
  }
}

class AnswerWidget extends StatelessWidget {
  final String option;
  final int index;
  final bool correct;
  final bool selected;
  final bool answered;
  final ValueChanged<int> onAnswer;

  AnswerWidget(
      {Key key,
      @required this.option,
      @required this.index,
      this.onAnswer,
      this.correct,
      this.answered: false,
      this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!answered)
      return GestureDetector(
          onTap: () => {this.onAnswer(index)},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Center(child: Text(option)),
            ),
          ));
    else
      return Card(
        color: selected ? (correct ? Colors.green : Colors.red) : null,
        child: Center(
            child: Text(
          option,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      );
  }
}
