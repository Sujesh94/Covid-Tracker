import 'package:flutter/material.dart';
import 'package:contacttracingprototype/utilities/constants.dart';
class DoDontsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Text(
            'Do\'s',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Text(
          '1) Maintain Hygiene',
          style: kBottomModalSheet,
        ),
        Text(
          '2) Seek Medical Help if Symptoms Occur',
          style: kBottomModalSheet,
        ),
        Text(
          '3) Disinfect Packages After Receiving Them',
          style: kBottomModalSheet,
        ),
        Text(
          '4) Avoid Going Out',
          style: kBottomModalSheet,
        ),
        Text(
          '5) Drink Plenty of Water',
          style: kBottomModalSheet,
        ),
        Center(
          child: Text(
            'Don\'ts',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Text(
          '1) Do Not Eat Outside Food',
          style: kBottomModalSheet,
        ),
        Text(
          '2) Avoid Touching Your Face',
          style: kBottomModalSheet,
        ),
        Text(
          '3) Don’t Allow Children to Play Outside',
          style: kBottomModalSheet,
        ),
        Text(
          '4) Don’t Ignore Government-issued Advice',
          style: kBottomModalSheet,
        ),
        Text(
          '5) Don’t Panic',
          style: kBottomModalSheet,
        ),
      ],
    );
  }
}
