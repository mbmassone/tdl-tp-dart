import 'package:encuestdl_app/screen/ScreenTemplate.dart';
import 'package:flutter/cupertino.dart';

class PollFinishScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      child: Center(child: Text("Terminaste la encuesta! \n Gracias por participar"),),
    );
  }
}
