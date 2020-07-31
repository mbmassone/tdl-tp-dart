

class Submit {
  int id;
  String submitter;
  List<dynamic> responses;

  Submit(this.id, this.submitter, this.responses);

  factory Submit.fromJson(Map<String, dynamic> json) {
    List responses = json['responses'] as List;

    return Submit(json['id'], json['submitter'], responses);
  }
}
