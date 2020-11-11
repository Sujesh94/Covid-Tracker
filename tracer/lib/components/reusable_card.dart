import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.questionText,@required this.answerText});

  final String questionText;
  final String answerText;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      color: Color(0xFF3895D3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
      child: ExpandablePanel(
        header: Text(questionText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
        expanded: Text(answerText, softWrap: true,style: TextStyle(fontSize: 15,color: Colors.white), ),
        tapHeaderToExpand: true,
        hasIcon: true,
      ),
    );
  }
}