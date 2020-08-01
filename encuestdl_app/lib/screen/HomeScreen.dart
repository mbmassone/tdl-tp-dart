import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/screen/CreatePollScreen.dart';
import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:encuestdl_app/widget/HomeForm.dart';
import 'package:flutter/material.dart';

import 'PollScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeForm(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, '/poll/create'),
        },
        backgroundColor: Constants.primaryGrey,
        child: const Icon(Icons.add),
      ),
    );
  }

}
