import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PollCreationFinishScreen extends StatefulWidget {
  @override
  State<PollCreationFinishScreen> createState() =>
      _PollCreationFinishScreenState();
}

class _PollCreationFinishScreenState
    extends State<PollCreationFinishScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Crear encuesta",
      child: Column(
        children: <Widget>[
          Container(
            height: 75,
          ),
          Center(
            child: Container(
              height: 175,
              child: Text("¡Tu encuesta ha sido creada exitosamente!",
                  textAlign: TextAlign.center, textScaleFactor: 2),
            ),
          ),
          RaisedButton(
            child: Text(
              "Volver al inicio",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueGrey[700],
            onPressed: () => {
              Navigator.pop(
                context,
              ),
            },
          ),
        ],
      ),
    );
  }
}
