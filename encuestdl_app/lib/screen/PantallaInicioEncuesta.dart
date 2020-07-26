import 'package:encuestdl_app/screen/Template.dart';
import 'package:flutter/material.dart';

import 'PantallaEncuesta.dart';

class PantallaInicioEncuesta extends StatefulWidget {
  @override
  _PantallaInicioEncuestaState createState() => _PantallaInicioEncuestaState();
}

class _PantallaInicioEncuestaState extends State<PantallaInicioEncuesta> {
  int id_encuesta = null;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      child: Column(
        children: <Widget>[
          Container(
            height: 125,
            child: Center(
              child: Text("¡Bienvenido!",
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
            child: Center(
              child: TextField(
                controller: _controller,
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
          if (_controller.text.isNotEmpty)
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PantallaEncuesta(id_encuesta)),
              ),
            },
        },
        backgroundColor: Colors.blueGrey[700],
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
