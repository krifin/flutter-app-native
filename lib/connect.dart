import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class ConnectNew extends StatefulWidget {
  const ConnectNew({Key? key}) : super(key: key);

  @override
  State<ConnectNew> createState() => _ConnectNewState();
}

class _ConnectNewState extends State<ConnectNew> {
  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My App',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  var _session, _uri, _signature, session;

  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
          // if (await canLaunch(uri)) {
          //   await launchUrlString(uri, mode: LaunchMode.externalApplication);
          // } else {
          //   const playStoreUrl =
          //       'market://details?id=io.metamask'; // Metamask app id in play store
          //   if (await canLaunch(playStoreUrl)) {
          //     await launch(playStoreUrl);
          //   } else {
          //     throw 'Could not launch Metamask or Play Store';
          //   }
          // }
        });
        print(session.accounts[0]);
        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    connector.on(
        'connect',
        (session) => setState(
              () {
                _session = _session;
              },
            ));
    connector.on(
        'session_update',
        (payload) => setState(() {
              _session = payload;
              print(_session.accounts[0]);
              print(_session.chainId);
            }));
    connector.on(
        'disconnect',
        (payload) => setState(() {
              _session = null;
            }));
    return Scaffold(

        // backgroundColor: Colors.black,
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
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
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 200,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xff555556).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 15,
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
                          GestureDetector(
                            onTap: () {
                              loginUsingMetamask(context);
                            },
                            child: Container(
                              width: 90.0,
                              height: 90.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                                color: Color(0xff555556).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/mask.png"),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "MetaMask",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              'If  you’re new?',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "emailSignup");
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Color(0xff7B61FF),
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
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
          border: Border.all(
            color: Colors.white,
            width: 0.5,
          ),
          color: Color(0xff555556).withOpacity(0.5),
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
