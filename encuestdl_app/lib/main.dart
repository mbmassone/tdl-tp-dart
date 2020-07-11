import 'package:encuestdl_app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'screen/HomeScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Constants.grisPrimario,
    ),
    home: Container(
      child: HomeScreen(),
    ),
  ));
}
