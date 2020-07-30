class Question {
  int questionId;
  int pollId;
  String value;
  List<String> options;

  Question(this.questionId, this.pollId, this.value, this.options);


  factory Question.fromJson(Map<String, dynamic> json) {
    var options = json['options'] as List;
    List<String> _options = options.map((o) => o.toString()).toList();

    return Question(
        json['id'] as int,
        json['poll'][0] as int,
        json['value'] as String,
        _options
    );
  }
}
