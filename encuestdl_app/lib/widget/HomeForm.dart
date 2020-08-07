import 'package:encuestdl_app/screen/PollScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() {
    return _HomeFormState();
  }
}

class _HomeFormState extends State<HomeForm> {
  final _formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    idController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nombre',
            ),
            controller: nameController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Ingrese su nombre.';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'ID de encuesta',
            ),
            controller: idController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Ingrese el ID de la encuesta.';
              }
              return null;
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, otherwise false.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PollScreen(
                            int.parse(idController.text), nameController.text)),
                  );
                }
              },
                child: Text(
                  "Jugar",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blueGrey[700],
            ),
          )
        ]));
  }
}
