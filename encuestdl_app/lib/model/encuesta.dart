import 'package:encuestdl_app/model/pregunta.dart';

class Encuesta {
  int encuestaId;
  String nombre;
  List<Pregunta> preguntas;

  Encuesta(this.encuestaId, this.nombre, this.preguntas);
  Encuesta.conId(this.nombre, this.preguntas);

  Encuesta.deJson(dynamic encuesta) {
    this.encuestaId = encuesta["id"];
    this.nombre = encuesta["name"];
    this.preguntas = new List<Pregunta>();

    encuesta['questions']
        .forEach((pregunta) => {this.preguntas.add(Pregunta.deJson(pregunta))});
  }

  int get id => encuestaId;
}
