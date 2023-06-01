import 'package:flutter/material.dart';

class AddMetaverse extends StatefulWidget {
  const AddMetaverse({Key? key}) : super(key: key);

  @override
  State<AddMetaverse> createState() => _AddMetaverseState();
}

class _AddMetaverseState extends State<AddMetaverse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "METAMAAP",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'BeVeitnamPro',
                          letterSpacing: 10),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '''As a metaverse council member you get access to a world of opportunities. We assist you in forming networks and partnerships with major leader, corporates, investors and institutions across the globe. As consultative partners in policy making we channelize your inputs in economic and industrial policy frameworks.
                      
Moreover,  Our Metaverse community supports projects that benefit the network with funding from the Metaverse Council treasury & support from our partner resources. We also work with you to develop your metaverse through our CAMlab initiative.

As a member, You may even submit a proposal for a project related to Metaverse world, infrastructure, or app development, marketing, community outreach, educational initiatives, and more.

Become a Metaverse Member & Get rewarded by Metaverse Council for helping build Web3 & Metaverse Ecosystem.

Membership to Metaverse Council is subject to approval by working & governing council*
There is No membership fee or charges**
                        ''',
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
                          Navigator.pushNamed(context, "addMetaForm");
                        },
                        child: Text('Add now'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
