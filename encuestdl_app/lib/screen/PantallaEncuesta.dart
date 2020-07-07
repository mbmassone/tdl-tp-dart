import 'dart:convert';

import 'package:encuestdl_app/model.dart';
import 'package:encuestdl_app/screen/Template.dart';
import 'package:encuestdl_app/widget/PreguntaWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PantallaEncuesta extends StatefulWidget {
  int id;

  PantallaEncuesta(int id) {
    this.id = id;
  }

  @override
  State createState() => _PantallaEncuestaState(id);
}

class _PantallaEncuestaState extends State<PantallaEncuesta> {
  _PantallaEncuestaState(int id) {
    this.id = id;
  }

  int id;
  int preguntaActual = 0;
  Future<Encuesta> futureEncuesta;

  @override
  void initState() {
    super.initState();
    futureEncuesta = fetchEncuesta();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Encuesta>(
        future: futureEncuesta,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ScreenTemplate(
              child: PreguntaWidget(snapshot.data.preguntas[preguntaActual]),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return ScreenTemplate(
              child:
                  Container(child: Center(child: CircularProgressIndicator())));
        });
  }

  Future<Encuesta> fetchEncuesta() async {
    final response = await http.get('https://google.com');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Encuesta.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

}
