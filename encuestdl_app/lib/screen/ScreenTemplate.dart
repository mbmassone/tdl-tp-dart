import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ScreenTemplate extends StatelessWidget {
  Widget child;
  Widget fab;
  String title;


  ScreenTemplate(
      {Widget child, Widget floatingActionButton, String title}) {
    this.child = child;
    this.fab = floatingActionButton;
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title != null ? title : "EncuesTDL"),
      ),
      body: child,
      floatingActionButton: fab,
    );
  }
}
