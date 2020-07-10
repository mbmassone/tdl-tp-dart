import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/screen/Template.dart';
import 'package:encuestdl_app/widget/NuevaPreguntaWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaCrearEncuesta extends StatefulWidget {
  @override
  State<PantallaCrearEncuesta> createState() => _PantallaCrearEncuestaState();
}

class _PantallaCrearEncuestaState extends State<PantallaCrearEncuesta> {
  List<NuevaPreguntaWidget> _list = List();

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
        title: "Crear encuesta",
        child: Column(
          children: <Widget>[for (var i in _list) NuevaPreguntaWidget()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            this.setState(() {
              _list.add(NuevaPreguntaWidget());
            })
          },
          backgroundColor: Constants.grisPrimario,
          child: const Icon(Icons.add),
        ));
  }
}
