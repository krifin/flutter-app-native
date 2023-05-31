import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHome1 extends StatefulWidget {
  const MyHome1({Key? key}) : super(key: key);

  @override
  State<MyHome1> createState() => _MyHome1State();
}

class _MyHome1State extends State<MyHome1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, "home", (route) => false);
                  },
                  child: Text("logout"))
            ],
          ),
        ),
      ),
    );
  }
}
