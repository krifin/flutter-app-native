import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/about.dart';
import 'package:flutterapp/addMetaForm.dart';
import 'package:flutterapp/addMetaverse.dart';

import 'package:flutterapp/connect.dart';
import 'package:flutterapp/emailLogin.dart';

import 'package:flutterapp/home.dart';
import 'package:flutterapp/homeAfterLogin.dart';
import 'package:flutterapp/metaverseDetail.dart';
import 'package:flutterapp/partners.dart';
import 'package:flutterapp/splash.dart';

import 'package:flutterapp/webP.dart';

import 'emailSignup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash',
    routes: {
      'web1': (context) => MyWeb(),
      'home': (context) => Home1(),
      'splash': (context) => MySplash1(),
      'connectnew': (context) => ConnectNew(),
      'emailLogin': (context) => EmailLogin(),
      'emailSignup': (context) => EmailSignup(),
      'home1': (context) => MyHome1(),
      'addMeta': (context) => AddMetaverse(),
      'addMetaForm': (context) => AddMetaForm(),
      'metaDetail': (context) => MetaverseDetail(),
      'about': (context) => AboutPage(),
      'partners': (context) => PartnersPage()
    },
  ));
}
