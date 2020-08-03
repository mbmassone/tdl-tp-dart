import 'dart:convert';

import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/model/Poll.dart';
import 'package:encuestdl_app/model/Question.dart';
import 'package:encuestdl_app/model/Submit.dart';
import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:encuestdl_app/widget/QuestionWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'PollFinishScreen.dart';

class PollScreen extends StatefulWidget {
  int id;
  String name;

  PollScreen(int id, String name) {
    this.id = id;
    this.name = name;
  }

  @override
  State createState() => _PollScreenState(id, name);
}

class _PollScreenState extends State<PollScreen> {
  _PollScreenState(int id, String name) {
    this.id = id;
    this.name = name;
  }

  int id;
  String name;
  bool _answered = false;

  Future<Poll> futurePoll;
  Future<Submit> futureSubmit;
  final GlobalKey<QuestionWidgetState> _questionStatekey = GlobalKey();
  int _questionIndex = 0;
  Poll _poll;
  Submit _submit;

  @override
  void initState() {
    super.initState();
    futurePoll = fetchPoll();
  }

  Future<Poll> fetchPoll() async {
    final response = await http.get(Constants.baseUrl + '/poll/${this.id}');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      _poll = Poll.fromJson(json.decode(response.body));
      futureSubmit = createNewSubmit();
      return _poll;
    } else {
      throw Exception('Failed to load poll');
    }
  }

  Future<Submit> createNewSubmit() async {
    final response = await http.post(Constants.baseUrl + '/submits',
        body: {"submitter": name, "poll": this.id.toString()});

    _submit = Submit.fromJson(json.decode(response.body));
    return _submit;
  }

  void onAnswered() {
    setState(() {
      _answered = true;
    });
  }

  void nextQuestion() {
    if (_questionIndex + 1 < _poll.questions.length) {
      setState(() {
        _answered = false;
        _questionIndex++;
      });
      _questionStatekey.currentState.updateQuestion(_poll.questions[_questionIndex]);
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PollFinishScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Poll>(
        future: futurePoll,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ScreenTemplate(
              child: Container(
                  child: FutureBuilder<Submit>(
                    future: futureSubmit,
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? QuestionWidget(
                          key: _questionStatekey,
                          question: _poll.questions[_questionIndex],
                          submit: _submit,
                          notifyAnswered: onAnswered)
                          : Center(child: CircularProgressIndicator());
                    },
                  )),
              floatingActionButton: _answered
                  ? FloatingActionButton(
                  onPressed: nextQuestion,
                  backgroundColor: Constants.primaryGrey,
                  child: const Icon(Icons.arrow_right))
                  : null,
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return ScreenTemplate(
              child:
              Container(child: Center(child: CircularProgressIndicator())));
        });
  }
}
