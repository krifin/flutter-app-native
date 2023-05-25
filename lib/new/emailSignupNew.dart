import 'package:flutter/material.dart';

class EmailSignupNew extends StatefulWidget {
  const EmailSignupNew({Key? key}) : super(key: key);

  @override
  State<EmailSignupNew> createState() => _EmailSignupNewState();
}

class _EmailSignupNewState extends State<EmailSignupNew> {
  bool _obscureText = true;
  bool _obscureTextComnfirm = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 450,
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
              Container(
                  child: Column(
                children: [
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Your Name',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Your Email',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    obscureText: _obscureTextComnfirm,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureTextComnfirm = !_obscureTextComnfirm;
                          });
                        },
                        child: Icon(
                          _obscureTextComnfirm
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
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
                    print('Button Pressed');
                  },
                  child: Text('Signup'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
