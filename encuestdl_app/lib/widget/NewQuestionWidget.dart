import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewQuestionWidget extends StatefulWidget {
  _NewQuestionWidgetState _newQuestionState;
  
  @override
  State<NewQuestionWidget> createState() => _newQuestionState = _NewQuestionWidgetState();

  addNewQuestion(){
    _newQuestionState._addNewQuestion();
  }
}

class _NewQuestionWidgetState extends State<NewQuestionWidget> {
  List<IndividualQuestionWidget> _list = List();

  @override
  Widget build(BuildContext context) {  
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15, right: 0, left: 0),
            child: Text("Preguntas", textAlign:TextAlign.center, textScaleFactor: 1.3),
          ),
          for(var i in _list) IndividualQuestionWidget(_list.length),
        ],
      ),
    );
  }

  void _addNewQuestion(){
    _list.add(IndividualQuestionWidget(_list.length + 1));
    setState(() {});
  }
}


class IndividualQuestionWidget extends StatefulWidget {
  int questionNumber;

  IndividualQuestionWidget(int questionNumber){
    this.questionNumber = questionNumber;
  }

  @override
  State<IndividualQuestionWidget> createState() => _IndividualQuestionWidgetState(questionNumber);
}

class _IndividualQuestionWidgetState extends State<IndividualQuestionWidget> {
  int questionNumber; 
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  
  _IndividualQuestionWidgetState(int questionNumber){
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
                
                decoration:
                InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Pregunta $questionNumber",
                  //labelStyle: TextStyle(fontSize: 0.1),
                  prefixIcon: const Icon(Icons.live_help)
                  ),
            ),
            
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _controller1,
                    obscureText: false,
                    decoration: InputDecoration(labelText: 'Opción 1')
                  ),

                  TextField(
                    controller: _controller1,
                    obscureText: false,
                    decoration: InputDecoration(labelText: 'Opción 2')
                  ),

                  TextField(
                    controller: _controller1,
                    obscureText: false,
                    decoration: InputDecoration(labelText: 'Opción 3')
                  ),

                  TextField(
                    controller: _controller1,
                    obscureText: false,
                    decoration: InputDecoration(labelText: 'Opción 4')
                  ),
                ],
              ),
            ),

                      ],
        ),
      ),
    );
  }

  bool _controllerIsNotEmpty() {
    return _controller.text.isNotEmpty;
  }
}
