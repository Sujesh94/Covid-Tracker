import 'package:flutter/material.dart';
import 'package:contacttracingprototype/components/dos_donts_list.dart';
class ModalBottomSheetStyle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: Color(0xFF757575),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF4082FF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: 300,
          child: DoDontsList(),
        ),
      ),
    );
  }
}

