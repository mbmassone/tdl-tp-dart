import 'package:flutter/material.dart';

void main() {
  runApp(PantallaIncio() );
  //runApp(PantallaEncuesta(1234));
}

class PantallaIncio extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey[700],
      ),
      home: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text("EncuesTDL"),
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: 125,
                child: Center(
                  child: Text("¡Bienvenido!", textAlign: TextAlign.center, textScaleFactor: 1.5),
                ),
              ),
              Container(
                height: 125,
                child: Center(
                  child: Text("Ingrese el ID de la encuesta:", textAlign: TextAlign.center, textScaleFactor: 2),
                ),
              ),
              Container(
                //height: 100,
                child: Center(
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ID',
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => runApp(PantallaEncuesta(1234) ),
            backgroundColor: Colors.blueGrey[700],
            child: const Icon(Icons.play_arrow),
          ),
        ),
      ),
    );
  }
}

class PantallaEncuesta extends StatelessWidget{ //Haria que resiva el vector de la pregunta con sus opciones o hacemos una clase Pregunta que contenga sus opciones
  @override
  int id;

  PantallaEncuesta(int id){
    this.id = id;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey[700],
      ),
      home: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text("$id"),
          ),
          body: Column(
            children: <Widget>[
              Container( //Pregunta
                height: 250,
                child: Center(
                  child: Text("Pregunta: Quien es el mas mejor", textAlign: TextAlign.center, textScaleFactor: 1.5),
                ),
              ),
              Container( //Opciones
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Charly'),
                      leading: Radio(
                        //value: SingingCharacter.lafayette,
                        //*groupValue: _character,
                        //onChanged: (SingingCharacter value) {
                        //  setState(() { _character = value; });
                        //},//*/
                      ),
                    ),
                    ListTile(
                      title: const Text('Carlos Damian'),
                      leading: Radio(
                        /*value: SingingCharacter.jefferson,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() { _character = value; });
                        },*/
                      ),
                    ),
                    ListTile(
                      title: const Text('El Carlo'),
                      leading: Radio(
                        /*value: SingingCharacter.jefferson,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() { _character = value; });
                        },*/
                      ),
                    ),
                    ListTile(
                      title: const Text('Ninguna de las anteriores'),
                      leading: Radio(
                        /*value: SingingCharacter.jefferson,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() { _character = value; });
                        },*/
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}