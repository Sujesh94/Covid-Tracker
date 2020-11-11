import 'package:contacttracingprototype/screens/login.dart';
import 'package:contacttracingprototype/screens/nearby_interface.dart';
import 'package:contacttracingprototype/screens/registration.dart';
import 'package:contacttracingprototype/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:contacttracingprototype/screens/home_page.dart';
import 'package:contacttracingprototype/service/service_locator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        NearbyInterface.id: (context) => NearbyInterface(),
        SplashScreen.id:(context)=>SplashScreen(),
        CommonScreen.id:(context)=>CommonScreen(),
      },
    );
  }
}
