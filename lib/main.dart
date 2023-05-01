import 'package:flutter/material.dart';
import 'package:flutterapp/login.dart';
import 'package:flutterapp/webP.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'login',
    routes: {'web1': (context) => MyWeb(), 'login': (context) => LoginPage()},
  ));
}
