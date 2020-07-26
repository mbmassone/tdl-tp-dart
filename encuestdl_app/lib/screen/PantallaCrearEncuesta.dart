import 'package:encuestdl_app/screen/Template.dart';
import 'package:encuestdl_app/widget/NuevaEncuestaWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PantallaLlenarEncuesta.dart';

class PantallaCrearEncuesta extends StatefulWidget {
  @override
  State<PantallaCrearEncuesta> createState() => _PantallaCrearEncuestaState();
}

class _PantallaCrearEncuestaState extends State<PantallaCrearEncuesta> {
  List<NuevaEncuestaWidget> _list = List();
  NuevaEncuestaWidget pregunta = NuevaEncuestaWidget();

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Crear encuesta",
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: pregunta,
          ),
          RaisedButton(
            child: Text(
              "Siguiente",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueGrey[700],
            onPressed: () => {
              //_chequeoNombre(context, _controller.text)
              if (pregunta.textIsNotEmpty())
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
//                    builder: (context) => PantallaEncuesta(id_encuesta)),
                        builder: (context) => PantallaLlenarEncuesta(1)),
                  ),
                },
            },
          ),
        ],
      ),
    );
  }
}
