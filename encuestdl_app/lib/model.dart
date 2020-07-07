
class Encuesta {

  final int encuestaId;
  final List<Pregunta> preguntas;

  Encuesta({this.encuestaId, this.preguntas});

  factory Encuesta.fromJson(Map<String, dynamic> json) {
    // TODO: Mappear json del back
    return Encuesta(
//      encuestaId: json['']
//      preguntas: for pregunta json[''], // json array
    );
  }
}

class Pregunta {
  final int preguntaId;
  final int encuestaId;
  final String pregunta;
  final List<Respuesta> respuestas;

  Pregunta({this.preguntaId, this.encuestaId,  this.pregunta, this.respuestas});

  factory Pregunta.fromJson(Map<String, dynamic> json) {
    // TODO: Mappear json del back
    return Pregunta(
//      preguntaId: json['userId'],
//      pregunta: json['id'],
    );
  }
}


class Respuesta {

  final int respuestaId;
  final int preguntaId;
  final String respuesta;
  final bool correcta;

  Respuesta({this.respuestaId, this.preguntaId, this.respuesta, this.correcta});

  factory Respuesta.fromJson(Map<String, dynamic> json) {
    // TODO: Mappear json del back
    return Respuesta(
//      respuestaId: json['']
//      preguntaId: json[''],
//      respuesta: json[''],
    );
  }
}