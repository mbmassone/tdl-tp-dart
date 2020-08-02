import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PollDataWidget extends StatefulWidget {
  _PollDataWidgetState _newPollData;

  @override
  State<PollDataWidget> createState() => _newPollData = _PollDataWidgetState();

  bool textIsEmpty() {
    return _newPollData._controllerIsEmpty();
  }
}

class _PollDataWidgetState extends State<PollDataWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
              child: Text(
                "Ingrese el nombre de la encuesta:",
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          TextField(
            controller: _controller,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre de encuesta',
            ),
          ),
        ],
      ),
    );
  }

  bool _controllerIsEmpty() {
    return _controller.text.isEmpty;
  }
}
