import 'package:flutter/material.dart';

class MetaverseDetail extends StatefulWidget {
  const MetaverseDetail({Key? key}) : super(key: key);

  @override
  State<MetaverseDetail> createState() => _MetaverseDetailState();
}

class _MetaverseDetailState extends State<MetaverseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "METAMAAP",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'BeVeitnamPro',
                        letterSpacing: 10),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23.0),
                  image: DecorationImage(
                    opacity: 0.5,
                    image: NetworkImage(
                        'https://pbs.twimg.com/media/FKhwNrFWYAEaaDQ.jpg:large'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "DECENTRALAND",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'BeVeitnamPro',
                            letterSpacing: 10),
                      ),
                    ),
                    Text(
                      'We are solving interoperability for VR & gaming platforms which can be either on-chain or off-chain.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
