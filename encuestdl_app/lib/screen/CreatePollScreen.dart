import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:encuestdl_app/widget/PollDataWidget.dart';
import 'package:encuestdl_app/widget/NewQuestionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePollScreen extends StatefulWidget {
  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  PollDataWidget _pollName = PollDataWidget();
  NewQuestionWidget _questions = NewQuestionWidget();

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Crear encuesta",
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          _questions.addNewQuestion(),
        },
        backgroundColor: Constants.primaryGrey,
        child: const Icon(Icons.arrow_right),
      ),
      child: ListView(
        children: <Widget>[
          _pollName,
          _questions,
          RaisedButton(
            child: Text(
              "Finalizar",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueGrey[700],
            onPressed: () {
              /*if(!_pollName.textIsNotEmpty())
                _noNameShowDialog();
              */
              _finish(context);
            },
          ),
        ],
      ),
    );
  }

  Future _finish(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Encuesta creada correctamente'),
        content: RaisedButton(
          child: Text(
            "Volver a pantalla de inicio",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () => {
            Navigator.pop(context), //Todo acomodar esto
            Navigator.pop(context),
          },
        ),
      ),
    );
  }
}
