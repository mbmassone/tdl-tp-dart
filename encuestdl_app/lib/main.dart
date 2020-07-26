import 'package:encuestdl_app/screen/PantallaCrearEncuesta.dart';
import 'package:encuestdl_app/screen/PantallaFinCreacionEncuesta.dart';
import 'package:encuestdl_app/screen/PantallaSeleccionInicio.dart';
import 'package:encuestdl_app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'screen/PantallaInicioEncuesta.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blueGrey[700],
    ),
    home: Container(
      child: PantallaSeleccionInicio(),
    ),
    routes: <String, WidgetBuilder>{
      '/inicioResolverEncuesta': (BuildContext context) => new PantallaInicioEncuesta(),
      '/inicioCrearEncuesta': (BuildContext context) =>
          new PantallaCrearEncuesta(),
      '/finCreacionEncuesta': (BuildContext context) =>
          new PantallaFinCreacionEncuesta(),
    },
  ));
}
