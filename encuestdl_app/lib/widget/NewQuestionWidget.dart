import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewQuestionWidget extends StatefulWidget {
  @override
  State<NewQuestionWidget> createState() => _NewQuestionWidgetState();
}

class _NewQuestionWidgetState extends State<NewQuestionWidget> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container( 
            margin: const EdgeInsets.only(top: 20, bottom: 20, right: 0, left: 0),
            child: TextField(
              controller: _controller,
              obscureText: false,
              decoration:
              InputDecoration(border: OutlineInputBorder(), labelText: 'Pregunta'),
            ),
          ),
          
          Container(
            margin: const EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 20),
            child: TextField(
            controller: _controller1,
            obscureText: false,
            decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: 'Opción'),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 20),
            child: TextField(
            controller: _controller2,
            obscureText: false,
            decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: 'Opción'),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 20),
            child: TextField(
            controller: _controller3,
            obscureText: false,
            decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: 'Opción'),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 20),
            child: TextField(
            controller: _controller4,
            obscureText: false,
            decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: 'Opción'),
            ),
          ),

        ],
      ),
    );
  }

  bool _controllerIsNotEmpty() {
    return _controller.text.isNotEmpty;
  }
}
