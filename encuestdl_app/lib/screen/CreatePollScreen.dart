import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/screen/Template.dart';
import 'package:encuestdl_app/widget/NewQuestionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePollScreen extends StatefulWidget {
  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  List<NewQuestionWidget> _list = List();

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
        title: "Crear encuesta",
        child: Column(
          children: <Widget>[for (var i in _list) NewQuestionWidget()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            this.setState(() {
              _list.add(NewQuestionWidget());
            })
          },
          backgroundColor: Constants.primaryGrey,
          child: const Icon(Icons.add),
        ));
  }
}
