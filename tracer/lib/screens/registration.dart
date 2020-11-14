import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacttracingprototype/components/rounded_button.dart';
import 'package:contacttracingprototype/screens/welcome_screen.dart';
import 'package:contacttracingprototype/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:contacttracingprototype/screens/home_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  Firestore _firestore = Firestore.instance;
  bool showSpinner = false;
  String email;
  String password;
  String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/kerala1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    userName = value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Username'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password(atleast 6 characters)'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Register',
                  colour: Color(0xFF4082FF),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        _firestore.collection('users').document(email).setData({
                          'username': userName,
                        }).then((value) async{
                          SharedPreferences prefs=await SharedPreferences.getInstance();
                          prefs.setString('email', email);
                        });
                        Navigator.pushNamed(context, CommonScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      if(userName==null || email==null || password==null){
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "Registration failed",
                          desc: 'All fields are mandatory',
                          buttons: [
                            DialogButton(
                              color: Colors.orange,
                              child: Text(
                                "Ok",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pushNamed(context, WelcomeScreen.id),
                              width: 120,
                            )
                          ],
                        ).show();
                      }else{
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "Registration failed",
                          desc: 'Email already registered',
                          buttons: [
                            DialogButton(
                              color: Colors.orange,
                              child: Text(
                                "Ok",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pushNamed(context, WelcomeScreen.id),
                              width: 120,
                            )
                          ],
                        ).show();
                      }

                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
