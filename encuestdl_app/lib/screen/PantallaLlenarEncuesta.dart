import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:encuestdl_app/widget/LlenarEncuestaWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaLlenarEncuesta extends StatefulWidget {
  int numPregunta;

  @override
  State<PantallaLlenarEncuesta> createState() =>
      _PantallaLlenarEncuestaState(numPregunta);

  PantallaLlenarEncuesta(int numPregunta) {
    this.numPregunta = numPregunta;
  }
}

class _PantallaLlenarEncuestaState extends State<PantallaLlenarEncuesta> {
  int numPregunta;

  _PantallaLlenarEncuestaState(int numPregunta) {
    this.numPregunta = numPregunta;
  }

  @override
  Widget build(BuildContext context) {
    LlenarEncuestaWidget nuevoWidget = LlenarEncuestaWidget(numPregunta);
    return ScreenTemplate(
      title: "Agregar preguntas",
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: nuevoWidget,
          ),
          RaisedButton(
            child: Text(
              "Agregar otra pregunta",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueGrey[700],
            onPressed: () => {
              if (nuevoWidget.textIsNotEmpty())
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PantallaLlenarEncuesta(numPregunta + 1)),
                  )
                }
            },
          ),
          RaisedButton(
            child: Text(
              "Finalizar",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueGrey[700],
            onPressed: () => {
              if (nuevoWidget.textIsNotEmpty())
                {
                  Navigator.pushNamedAndRemoveUntil(context,
                      '/finCreacionEncuesta', ModalRoute.withName('/')),
                },
            },
          ),
        ],
      ),
    );
  }
}
