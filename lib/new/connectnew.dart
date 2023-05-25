import 'package:flutter/material.dart';

class ConnectNew extends StatefulWidget {
  const ConnectNew({Key? key}) : super(key: key);

  @override
  State<ConnectNew> createState() => _ConnectNewState();
}

class _ConnectNewState extends State<ConnectNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 340,
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Color(0xff19191B),
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    )),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'METAMAAP',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'BeVeitnamPro',
                      letterSpacing: 10),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomContainer(
                  image: "assets/google.png",
                  text: 'Google',
                ),
                SizedBox(
                  width: 2,
                ),
                CustomContainer(
                  image: "assets/mask.png",
                  text: 'MetaMask',
                ),
                SizedBox(
                  width: 2,
                ),
                CustomContainer(
                  image: "assets/mail.png",
                  text: 'Use Email',
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Are you new?',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff7B61FF),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "emailSignup");
                    },
                    child: Text('Sign up'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String image;
  final String text;

  CustomContainer({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('$text container pressed');
        if (text == "Use Email") {
          Navigator.pushNamed(context, "emailLogin");
        }
      },
      child: Container(
        width: 90.0,
        height: 90.0,
        decoration: BoxDecoration(
          color: Color(0XFF38383D),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(image),
            SizedBox(
              height: 7,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
