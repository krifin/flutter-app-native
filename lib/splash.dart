import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MySplash1 extends StatefulWidget {
  const MySplash1({Key? key}) : super(key: key);

  @override
  State<MySplash1> createState() => _MySplash1State();
}

class _MySplash1State extends State<MySplash1> {
  checkForUserStatus() {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        Future.delayed(
          Duration(seconds: 3),
          () {
            Navigator.pushNamedAndRemoveUntil(
                context, 'home', (route) => false);
          },
        );
      } else {
        print('User is signed in!');
        Future.delayed(
          Duration(seconds: 3),
          () {
            Navigator.pushNamedAndRemoveUntil(
                context, 'home1', (route) => false);
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkForUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: Center(
          child: Text(
        "METAMAAP",
        style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontFamily: 'BeVeitnamPro',
            letterSpacing: 10),
      )),
    );
  }
}
