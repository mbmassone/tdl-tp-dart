import 'package:encuestdl_app/constants/constants.dart';
import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:flutter/material.dart';

import 'PollScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pollId = null;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      child: Column(
        children: <Widget>[
          Container(
            height: 125,
            child: Center(
              child: Text("¡Bienvenido!",
                  textAlign: TextAlign.center, textScaleFactor: 1.5),
            ),
          ),
          Container(
            height: 125,
            child: Center(
              child: Text("Ingrese el ID de la encuesta:",
                  textAlign: TextAlign.center, textScaleFactor: 2),
            ),
          ),
          Container(
            //height: 100,
            child: Center(
              child: TextField(
                controller: _controller,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ID',
                ),
                onChanged: _updateId,
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          RaisedButton(
            child: Text(
              "Jugar",
              style: TextStyle(color: Colors.white),
            ),
            color: Constants.primaryGrey,
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PollScreen(pollId)),
              )
            },
          ),
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

  void _updateId(String id) {
    setState(() {
      pollId = int.parse(id);
    });
  }
}
