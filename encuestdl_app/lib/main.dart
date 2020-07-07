import 'package:flutter/material.dart';

import 'screen/PantallaInicio.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.blueGrey[700],
    ),
    home: Container(
      child: PantallaInicio(),
    ),
  ));

  //runApp(PantallaEncuesta(1234));
}
