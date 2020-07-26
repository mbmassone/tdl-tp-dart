import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenTemplate extends StatelessWidget {
  Widget child;
  FloatingActionButton fab;
  String title;

  ScreenTemplate({Widget child, FloatingActionButton floatingActionButton, String title}) {
    this.child = child;
    this.fab = floatingActionButton;
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(icon:Icon(Icons.chevron_left),/*onPressed:() => /Navigator.pop(context, false),*/),
        title: Text(title != null ? title : "EncuesTDL"),
      ),
      body: child,
      floatingActionButton: fab,
    );
  }
}
