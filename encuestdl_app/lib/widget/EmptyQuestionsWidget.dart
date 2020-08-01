import 'package:encuestdl_app/widget/NewQuestionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyQuestionsWidget extends StatefulWidget {
  @override
  State<EmptyQuestionsWidget> createState() => _EmptyQuestionsWidgetState();
}

class _EmptyQuestionsWidgetState extends State<EmptyQuestionsWidget> {
  List<NewQuestionWidget> _list = List();
  
  

  @override
  Widget build(BuildContext context) {  
    return Card(
      child: Column(
      children: <Widget>[
        for(var i in _list) NewQuestionWidget(),

        RaisedButton(
            child: Text(
              "Agregar otra pregunta",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueGrey[700],
            onPressed: () {
                setState(() {
                  
                });
               _list.add(NewQuestionWidget());

            },
          ),
      ],
      ),
    );
  }

}
