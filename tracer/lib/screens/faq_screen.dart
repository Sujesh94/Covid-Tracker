import 'package:flutter/material.dart';
import 'package:contacttracingprototype/components/reusable_card.dart';
import 'package:contacttracingprototype/utilities/constants.dart';


class FAQ extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ReusableCard(questionText: kFaqQuestion1,answerText: kFaqAnswer1,),
        ReusableCard(questionText: kFaqQuestion2,answerText: kFaqAnswer2,),
        ReusableCard(questionText: kFaqQuestion3,answerText: kFaqAnswer3,),
        ReusableCard(questionText: kFaqQuestion4,answerText: kFaqAnswer4,),
        ReusableCard(questionText: kFaqQuestion5,answerText: kFaqAnswer5,),
        ReusableCard(questionText: kFaqQuestion6,answerText: kFaqAnswer6,),
        ReusableCard(questionText: kFaqQuestion7,answerText: kFaqAnswer7,),
        ReusableCard(questionText: kFaqQuestion8,answerText: kFaqAnswer8,),
      ],
    );
  }
}

