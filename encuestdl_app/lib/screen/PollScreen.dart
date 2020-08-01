import 'dart:convert';

import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/model/Poll.dart';
import 'package:encuestdl_app/model/Submit.dart';
import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:encuestdl_app/widget/QuestionWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  int actualQuestion = 0;
  bool answered = false;

  Future<Poll> futurePoll;
  Poll _poll;
  Submit _submit;

  Future<bool> futureQuestionAnswered;
  bool _questionAnswered;

  QuestionWidget questionWidget;

  @override
  void initState() {
    super.initState();
    futurePoll = fetchPoll();
    createNewSubmit();
  }
  Future<void> createNewSubmit() async{
    final newSubitResponse = await http.post( Constants.baseUrl + '/submits', body:{
      "submitter": name,
      "poll": this.id.toString()
    });

    _submit =  Submit.fromJson(json.decode(newSubitResponse.body));
    print(json.decode(newSubitResponse.body));
  }

  Future<Poll> fetchPoll() async {
    final response =
        await http.get(Constants.baseUrl + '/poll/${this.id}');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      _poll = Poll.fromJson(json.decode(response.body));
      questionWidget = QuestionWidget(_poll.questions[actualQuestion],_handleQuestionAnswered,);
      return _poll;
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Error al obtener la encuesta")));
      Navigator.pop(context);
    }
  }

  Future<bool> _checkAnswer(int answer) async {
    final response = await http
        .patch(Constants.baseUrl + '/submit/${_submit.id}',body: {"response": (answer + 1).toString()});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  _handleQuestionAnswered(int answer) async{
    bool succesful = await _checkAnswer(answer);

    if(actualQuestion + 1 >= _poll.questions.length)
      return;
    questionWidget.updateQuestion(_poll.questions[actualQuestion+1]);

    setState(() {
      actualQuestion = actualQuestion + 1;
    });

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Poll>(
        future: futurePoll,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ScreenTemplate(
              child: questionWidget
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
