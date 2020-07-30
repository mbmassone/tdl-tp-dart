import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:encuestdl_app/widget/PollDataWidget.dart';
import 'package:encuestdl_app/widget/NewQuestionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PantallaLlenarEncuesta.dart';

class CreatePollScreen extends StatefulWidget {
  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  List<NewQuestionWidget> _list = List();
  PollDataWidget pregunta = PollDataWidget();
  // TODO: Convertir PantallaLlenarEncuesta a "NewQuestionWidget" e ir generando una lista de preguntas

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Crear encuesta",
      child: Column(
        children: <Widget>[
          PollDataWidget(),
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
