import 'dart:async';
import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'nearby_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:contacttracingprototype/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/splash1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        // child: Center(
        //   child:
        // Text(
        //     'Covid Watch',
        //     style: TextStyle(
        //         color: Color(
        //           0xFF4082FF,
        //         ),
        //         fontWeight: FontWeight.bold,
        //         fontSize: 25),
        //   ),
        //   //Image.asset('images/logo.png',width: 100,height: 500,),
        // ),
      ),
    );
  }

  void navigateUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var isLogged = preferences.getString('email');
    if (isLogged != null) {
      Navigator.pushReplacementNamed(context, CommonScreen.id);
    } else {
      Navigator.pushReplacementNamed(context, WelcomeScreen.id);
    }
  }
}
