import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NuevaEncuestaWidget extends StatefulWidget {
  _NuevaEncuestaWidgetState nuevaEncuesta = _NuevaEncuestaWidgetState();

  @override
  State<NuevaEncuestaWidget> createState() => nuevaEncuesta;

  bool textIsNotEmpty() {
    return nuevaEncuesta._controllerIsNotEmpty();
  }
}

class _NuevaEncuestaWidgetState extends State<NuevaEncuestaWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            child: Center(
              child: Text(
                "Ingrese el nombre de la encuesta a crear:",
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
