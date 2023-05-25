import 'package:flutter/material.dart';

class MySplash1 extends StatefulWidget {
  const MySplash1({Key? key}) : super(key: key);

  @override
  State<MySplash1> createState() => _MySplash1State();
}

class _MySplash1State extends State<MySplash1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      },
    );
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
