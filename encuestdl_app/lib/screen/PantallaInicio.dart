import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/screen/PantallaCrearEncuesta.dart';
import 'package:encuestdl_app/screen/Template.dart';
import 'package:flutter/material.dart';

import 'PantallaEncuesta.dart';

class PantallaInicio extends StatefulWidget {
  @override
  _PantallaInicioState createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  int id_encuesta = null;

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      child: Column(
        children: <Widget>[
          Container(
            height: 125,
            child: Center(
              child: Text("¡Bienvenassasido!",
                  textAlign: TextAlign.center, textScaleFactor: 1.5),
            ),
          ),
          Container(
            height: 125,
            child: Center(
              child: Text("Ingrese el ID de la encuesta:",
                  textAlign: TextAlign.center, textScaleFactor: 2),
            ),
          ),
          Container(
            //height: 100,
            child: Center(
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ID',
                ),
                onChanged: _updateId,
                keyboardType: TextInputType.number,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
//                builder: (context) => PantallaEncuesta(id_encuesta)),
                builder: (context) => PantallaCrearEncuesta()),
          )
        },
        backgroundColor: Constants.grisPrimario,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  void _updateId(String id) {
    setState(() {
      id_encuesta = int.parse(id);
    });
  }
}
