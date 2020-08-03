import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewQuestionWidget extends StatefulWidget {
  int questionNumber;

  _NewQuestionWidgetState _newQuestion;

  NewQuestionWidget(int questionNumber) {
    this.questionNumber = questionNumber;
  }

  @override
  State<NewQuestionWidget> createState() =>
      _newQuestion = _NewQuestionWidgetState(questionNumber);

  bool questionAndTwoOptionsFull() {
    return _newQuestion._questionAndTwoOptionsFull();
  }

  bool questionsWithCorrectOptionError() {
    return _newQuestion.noCorrectOptionSelected();
  }
}

class _NewQuestionWidgetState extends State<NewQuestionWidget> {
  int questionNumber;
  TextEditingController _questionController = TextEditingController();
  TextEditingController _option1Controller = TextEditingController();
  TextEditingController _option2Controller = TextEditingController();
  TextEditingController _option3Controller = TextEditingController();
  TextEditingController _option4Controller = TextEditingController();

  int correctOption = 0;

  _NewQuestionWidgetState(int questionNumber) {
    this.questionNumber = questionNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 250,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: TextField(
                controller: _questionController,
                obscureText: false,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  labelText: "Pregunta $questionNumber",
                  contentPadding: const EdgeInsets.symmetric(vertical: 0.01),
                  prefixIcon: Icon(
                    Icons.help_outline,
                    color: Colors.green[500],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, bottom: 0.01),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _option1Controller,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Opción 1',
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.01),
                      prefixIcon: Radio(
                        value: 1,
                        groupValue: correctOption,
                        activeColor: Colors.green[500],
                        onChanged: (newValue) {
                          setState(() {
                            correctOption = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  TextField(
                    controller: _option2Controller,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Opción 2',
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.01),
                      prefixIcon: Radio(
                        value: 2,
                        groupValue: correctOption,
                        activeColor: Colors.green[500],
                        onChanged: (newValue) {
                          setState(() {
                            correctOption = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  TextField(
                    controller: _option3Controller,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Opción 3',
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.01),
                      prefixIcon: Radio(
                        value: 3,
                        groupValue: correctOption,
                        activeColor: Colors.green[500],
                        onChanged: (newValue) {
                          setState(() {
                            correctOption = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  TextField(
                    controller: _option4Controller,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Opción 4',
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.01),
                      prefixIcon: Radio(
                        value: 4,
                        groupValue: correctOption,
                        activeColor: Colors.green[500],
                        onChanged: (newValue) {
                          setState(() {
                            correctOption = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _twoOptionsFull() {
    int optionsFull = 0;
    if (_option1Controller.text.isNotEmpty) optionsFull++;
    if (_option2Controller.text.isNotEmpty) optionsFull++;
    if (_option3Controller.text.isNotEmpty) optionsFull++;
    if (_option4Controller.text.isNotEmpty) optionsFull++;

    return (optionsFull >= 2);
  }

  bool _questionAndTwoOptionsFull() {
    return (_questionController.text.isNotEmpty && _twoOptionsFull());
  }

  bool emptyCorrectOptionSelected(int correctOption) {
    if (correctOption == 1)
      return _option1Controller.text.isEmpty;
    else if (correctOption == 2)
      return _option2Controller.text.isEmpty;
    else if (correctOption == 3)
      return _option3Controller.text.isEmpty;
    else
      return _option4Controller.text.isEmpty;
  }

  bool noCorrectOptionSelected() {
    return ((correctOption == 0) || emptyCorrectOptionSelected(correctOption));
  }
}
