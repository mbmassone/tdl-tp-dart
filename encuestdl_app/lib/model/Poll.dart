

import 'package:encuestdl_app/model/Question.dart';

class Poll {
  int pollId;
  String value;
  List<Question> questions;

  Poll(this.pollId, this.value, this.questions);

  factory Poll.fromJson(Map<String, dynamic> json) {
    List questionList = json['questions'] as List;
    List<Question> questions = questionList.map((i) => Question.fromJson(i)).toList();

    return Poll(
        json['id'], json['value'], questions);
  }
}

/*
[{
  "id":1,
  "name":"My super cool poll",
  "questions":[{
      "id":1,
      "value":"Which is charly's name?",
      "options":["Omar","Charly","Jose","Juan"],
      "correct":-1,
      "poll":{
          "id":1
         }
       }]
 }
]
 
*/
