import 'package:encuestdl_app/screen/Template.dart';
import 'package:flutter/material.dart';

class PantallaSeleccionInicio extends StatefulWidget {
  @override
  _PantallaSeleccionInicioState createState() =>
      _PantallaSeleccionInicioState();
}

class _PantallaSeleccionInicioState extends State<PantallaSeleccionInicio> {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            child: Center(
              child: Text("¡Bienvenido!",
                  textAlign: TextAlign.center, textScaleFactor: 1.5),
            ),
          ),
          Container(
            height: 135,
            child: Center(
              child: Text(
                  "EncuesTDL es un sistema para crear y realizar encuestas",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.5),
            ),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    "Realizar una",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueGrey[700],
                  onPressed: () => {
                    Navigator.pushNamed(context, '/inicioResolverEncuesta'),
                  },
                ),
                Container(
                  width: 75,
                ),
                RaisedButton(
                  child: Text(
                    "Crear una",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueGrey[700],
                  onPressed: () => {
                    Navigator.pushNamed(context, '/inicioCrearEncuesta'),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
