import 'package:encuestdl_app/screen/CreatePollScreen.dart';
import 'package:encuestdl_app/screen/PollCreationFinishScreen.dart';
import 'package:encuestdl_app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'screen/HomeScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Constants.primaryGrey,
    ),
    home: Container(
      child: HomeScreen(),
    ),
    routes: <String, WidgetBuilder>{
      '/poll/create': (BuildContext context) => new CreatePollScreen(),
      '/poll/creation-finished': (BuildContext context) => new PollCreationFinishScreen(),
    },
  ));
}
