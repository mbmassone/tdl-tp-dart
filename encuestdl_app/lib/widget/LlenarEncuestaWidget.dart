import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LlenarEncuestaWidget extends StatefulWidget {
  int numPregunta;
  _LlenarEncuestaWidgetState nuevoWidget;

  LlenarEncuestaWidget(int numPregunta) {
    this.numPregunta = numPregunta;
    this.nuevoWidget = _LlenarEncuestaWidgetState(numPregunta);
  }

  @override
  State<LlenarEncuestaWidget> createState() => nuevoWidget;

  bool textIsNotEmpty() {
    return nuevoWidget._allFieldsFull();
  }
}

class _LlenarEncuestaWidgetState extends State<LlenarEncuestaWidget> {
  TextEditingController _controller = TextEditingController();

  NuevaOpcionWidget op1 = NuevaOpcionWidget();
  NuevaOpcionWidget op2 = NuevaOpcionWidget();
  NuevaOpcionWidget op3 = NuevaOpcionWidget();
  NuevaOpcionWidget op4 = NuevaOpcionWidget();

  int numPregunta;

  _LlenarEncuestaWidgetState(int numPregunta) {
    this.numPregunta = numPregunta;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
          ),
          Container(
            height: 50,
            child: Text("Ingrese pregunta $numPregunta:"),
          ),
          Container(
            height: 100,
            child: TextField(
              controller: _controller,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pregunta $numPregunta'),
            ),
          ),
          op1,
          op2,
          op3,
          op4,
        ],
      ),
    );
  }

  bool _allFieldsFull() {
    return (_controller.text.isNotEmpty &&
        op1.textIsNotEmpty() &&
        op2.textIsNotEmpty() &&
        op3.textIsNotEmpty() &&
        op4.textIsNotEmpty());
  }
}

class NuevaOpcionWidget extends StatefulWidget {
  _NuevaOpcionWidgetState _nuevoWidget = _NuevaOpcionWidgetState();

  @override
  State<NuevaOpcionWidget> createState() => _nuevoWidget;

  bool textIsNotEmpty() {
    return _nuevoWidget._controllerIsNotEmpty();
  }
}

class _NuevaOpcionWidgetState extends State<NuevaOpcionWidget> {
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
