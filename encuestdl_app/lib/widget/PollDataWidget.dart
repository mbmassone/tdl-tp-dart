import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PollDataWidget extends StatefulWidget {
  _PollDataWidgetState nuevaEncuesta = _PollDataWidgetState();

  @override
  State<PollDataWidget> createState() => nuevaEncuesta;

  bool textIsNotEmpty() {
    return nuevaEncuesta._controllerIsNotEmpty();
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
            child: Center(
              child: Text(
                "Ingrese el nombre de la encuesta:",
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            child: TextField(
              controller: _controller,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre de encuesta',
              ),
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
