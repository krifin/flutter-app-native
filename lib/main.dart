import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/login.dart';
import 'package:flutterapp/new/connectnew.dart';
import 'package:flutterapp/new/emailLoginnew.dart';
import 'package:flutterapp/new/emailSignupNew.dart';
import 'package:flutterapp/new/home.dart';
import 'package:flutterapp/new/splash.dart';
import 'package:flutterapp/signup.dart';
import 'package:flutterapp/webP.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash',
    routes: {
      'web1': (context) => MyWeb(),
      'login': (context) => LoginPage(),
      'signup': (context) => SignupPage(),
      'home': (context) => Home1(),
      'splash': (context) => MySplash1(),
      'connectnew': (context) => ConnectNew(),
      'emailLogin': (context) => EmailLoginNew(),
      'emailSignup': (context) => EmailSignupNew()
    },
  ));
}
