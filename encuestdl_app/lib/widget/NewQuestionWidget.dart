import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewQuestionWidget extends StatefulWidget {
  _NewQuestionWidgetState _newQuestionState;

  @override
  State<NewQuestionWidget> createState() =>
      _newQuestionState = _NewQuestionWidgetState();

  bool noQuestions() {
    return _newQuestionState._noQuestions();
  }

  bool noOneQuestionFull() {
    return _newQuestionState._noOneQuestionFull();
  }

  bool questionsWithCorrectOptionError(){
    return _newQuestionState._questionsWithCorrectOptionError();
  }

  void addNewQuestion() {
    _newQuestionState._addNewQuestion();
  }
}

class _NewQuestionWidgetState extends State<NewQuestionWidget> {
  List<IndividualQuestionWidget> _list = List();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[700],
      child: Column(
        children: <Widget>[
          Container(
            margin:
                const EdgeInsets.only(top: 15, bottom: 15, right: 0, left: 0),
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

  bool _questionsWithCorrectOptionError(){
    bool returnValue = false;

    for (var i in _list)
      if(i.questionAndTwoOptionsFull())
        if (i.individualQuestionsWithCorrectOptionError()) returnValue = true;

    return returnValue;
  }

  void _addNewQuestion() {
    _list.add(IndividualQuestionWidget(_list.length + 1));
    setState(() {});
  }
}








class IndividualQuestionWidget extends StatefulWidget {
  int questionNumber;

  _IndividualQuestionWidgetState _individualQuestion;

  IndividualQuestionWidget(int questionNumber) {
    this.questionNumber = questionNumber;
  }

  @override
  State<IndividualQuestionWidget> createState() =>
      _individualQuestion = _IndividualQuestionWidgetState(questionNumber);

  bool questionAndTwoOptionsFull() {
    return _individualQuestion._questionAndTwoOptionsFull();
  }

  bool individualQuestionsWithCorrectOptionError(){
    return _individualQuestion._individualQuestionsWithCorrectOptionError();
  }
}

class _IndividualQuestionWidgetState extends State<IndividualQuestionWidget> {
  int questionNumber;
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  
  CorrectOptionButtonWidget _correctOptionButton1 = CorrectOptionButtonWidget();
  CorrectOptionButtonWidget _correctOptionButton2 = CorrectOptionButtonWidget();
  CorrectOptionButtonWidget _correctOptionButton3 = CorrectOptionButtonWidget();
  CorrectOptionButtonWidget _correctOptionButton4 = CorrectOptionButtonWidget();

  _IndividualQuestionWidgetState(int questionNumber) {
    this.questionNumber = questionNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 300,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Pregunta $questionNumber",
                  //labelStyle: TextStyle(fontSize: 0.1),
                  prefixIcon: const Icon(Icons.live_help)),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                      controller: _controller1,
                      obscureText: false,
                      decoration: InputDecoration(
                          labelText: 'Opción 1',
                          suffixIcon: _correctOptionButton1)),
                  TextField(
                      controller: _controller2,
                      obscureText: false,
                      decoration: InputDecoration(
                          labelText: 'Opción 2',
                          suffixIcon: _correctOptionButton2)),
                  TextField(
                      controller: _controller3,
                      obscureText: false,
                      decoration: InputDecoration(
                          labelText: 'Opción 3',
                          suffixIcon: _correctOptionButton3)),
                  TextField(
                      controller: _controller4,
                      obscureText: false,
                      decoration: InputDecoration(
                          labelText: 'Opción 4',
                          suffixIcon: _correctOptionButton4)),
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
    if (_controller1.text.isNotEmpty) optionsFull++;
    if (_controller2.text.isNotEmpty) optionsFull++;
    if (_controller3.text.isNotEmpty) optionsFull++;
    if (_controller4.text.isNotEmpty) optionsFull++;

    return (optionsFull >= 2);
  }

  bool _questionAndTwoOptionsFull() {
    return (_controller.text.isNotEmpty && _twoOptionsFull());
  }

  bool _controllerIsNotEmpty() {
    return _controller.text.isNotEmpty;
  }

  bool noCorrectOptionSelected(){
    return (!_correctOptionButton1.isCorrectOption() && 
            !_correctOptionButton2.isCorrectOption() &&
            !_correctOptionButton3.isCorrectOption() &&
            !_correctOptionButton4.isCorrectOption() );
  }

  bool invalidAmountOfCorrectOptionsSelected(){
    int totalOfCorrectOptions = 0;
    if(_correctOptionButton1.isCorrectOption() && _controller1.text.isNotEmpty) totalOfCorrectOptions++;
    if(_correctOptionButton2.isCorrectOption() && _controller2.text.isNotEmpty) totalOfCorrectOptions++;
    if(_correctOptionButton3.isCorrectOption() && _controller3.text.isNotEmpty) totalOfCorrectOptions++;
    if(_correctOptionButton4.isCorrectOption() && _controller4.text.isNotEmpty) totalOfCorrectOptions++;

    return (totalOfCorrectOptions != 1);
  }

  bool _individualQuestionsWithCorrectOptionError(){
    return (invalidAmountOfCorrectOptionsSelected() || noCorrectOptionSelected());
  }
}








class CorrectOptionButtonWidget extends StatefulWidget {
  _CorrectOptionButtonWidgetState correctOptionButton;

  @override
  State<CorrectOptionButtonWidget> createState() => correctOptionButton = _CorrectOptionButtonWidgetState();

  bool isCorrectOption(){
    return correctOptionButton._isCorrectOption();
  }

}

class _CorrectOptionButtonWidgetState extends State<CorrectOptionButtonWidget> {
  Icon _icon = Icon(Icons.clear);
  bool correctOption = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: _icon,
        onPressed: () {
          _setState();
        });
  }

  void _setState() {
    if (correctOption)
      _icon = Icon(Icons.clear);
    else
      _icon = Icon(Icons.check);

    correctOption = !correctOption;
    setState(() {});
  }

  bool _isCorrectOption(){
    return correctOption;
  }
}