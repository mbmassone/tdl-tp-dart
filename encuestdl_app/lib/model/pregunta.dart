class Pregunta {
  int preguntaId;
  int encuestaId;
  String pregunta;
  List<String> opciones;
  int opcionCorrectaId;

  Pregunta(this.preguntaId, this.encuestaId, this.pregunta, this.opciones,
      this.opcionCorrectaId);
  Pregunta.conId(
      this.encuestaId, this.pregunta, this.opciones, this.opcionCorrectaId);

  factory Pregunta.deJson(dynamic pregunta) {
    var opciones = pregunta['options'] as List<String>;
    List<String> _opciones = opciones.map((opcionJson) => opcionJson).toList();

    return Pregunta(pregunta['id'] as int, pregunta['poll'][0] as int,
        pregunta['value'] as String, _opciones, pregunta['correct'] as int);
  }
}
