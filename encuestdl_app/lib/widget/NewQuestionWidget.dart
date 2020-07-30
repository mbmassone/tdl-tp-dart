import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewQuestionWidget extends StatefulWidget {
  @override
  State<NewQuestionWidget> createState() => _NewQuestionWidgetState();
}

class _NewQuestionWidgetState extends State<NewQuestionWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextField(
        controller: _controller,
        obscureText: false,
        decoration:
        InputDecoration(border: OutlineInputBorder(), labelText: 'Opción'),
      ),
    );
  }

  bool _controllerIsNotEmpty() {
    return _controller.text.isNotEmpty;
  }
}
