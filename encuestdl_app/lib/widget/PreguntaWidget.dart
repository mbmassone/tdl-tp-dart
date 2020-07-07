import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model.dart';

class PreguntaWidget extends StatefulWidget {
  Pregunta pregunta;

  PreguntaWidget(Pregunta pregunta) {
    this.pregunta = pregunta;
  }

  @override
  State<PreguntaWidget> createState() => _PreguntaWidgetState(pregunta);
}

class _PreguntaWidgetState extends State<PreguntaWidget> {
  Pregunta _pregunta;
  Respuesta _respuestaSeleccionada;

  _PreguntaWidgetState(Pregunta pregunta) {
    this._pregunta = pregunta;
  }

  void _updateRespuesta(Respuesta seleccionada) {
    setState(() {
      _respuestaSeleccionada = seleccionada;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        //Pregunta
        Container(
          height: 250,
          child: Center(
            child: Text("Pregunta: Quien es el mas mejor?",
                textAlign: TextAlign.center, textScaleFactor: 1.5),
          ),
        ),

        //Opciones
        Container(
          child: Column(
            children: <Widget>[
              for (Respuesta r in _pregunta.respuestas)
                ListTile(
                  title: Text(r.respuesta),
                  leading: Radio(
                    value: r,
                    groupValue: _respuestaSeleccionada,
                    onChanged: _updateRespuesta,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
