import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:contacttracingprototype/screens/nearby_interface.dart';
class CommonBottomSheet extends StatefulWidget {

  @override
  _CommonBottomSheetState createState() => _CommonBottomSheetState();
}

class _CommonBottomSheetState extends State<CommonBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: double.infinity,

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFF4082FF),
          ),
        ],
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('images/bottom_image.jpg'),
          SizedBox(width: 15,),
          Center(child: Text('അകലമാണ് പുതിയ അടുപ്പം',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),),
          // IconButton(
          //   icon:Image.asset('images/corona.png') ,
          //   //FaIcon(FontAwesomeIcons.stethoscope,color: Colors.white,)
          //   iconSize: 15.0,
          //   onPressed: () {},
          // ),
          // Text('View Nearby', style: TextStyle(color: Color(0xFF4082FF),),),

        ],
      ),
    );
  }
}
