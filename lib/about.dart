import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Color(0xff1E1E1E)
        backgroundColor: Colors.black,
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
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 20),
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23.0),
                        image: DecorationImage(
                          opacity: 0.5,
                          image: AssetImage('assets/about-banner.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "A 3D Search Engine for Metaverse",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "A Web 3.0 search engine is leveraging the power of our proprietary interoperable MCTTP Blockchain Architecture And our custom A.I. model.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Teleport any digital asset",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 20),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23.0),
                          color: Color(0xff1E1E1E)),
                      child: Center(
                        child: Text(
                          "We are solving interoperability for VR & gaming platforms which can be either on-chain or off-chain.",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "A.I Experience Recognition",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 20),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23.0),
                          color: Color(0xff1E1E1E)),
                      child: Center(
                        child: Text(
                          "Our custom computer vision-based A.I. model can recognize any 3D asset in our galaxy of prominent digital worlds.",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Connect every virtual world",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 20),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23.0),
                          color: Color(0xff1E1E1E)),
                      child: Center(
                        child: Text(
                          "We have mapped 800+ metaverses, digital worlds, games & virtual reality platforms with their assets.",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "ABOUT",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '''Metamaap OR the Map of the entire metaverse ecosystem is a platform which leverages cutting-edge technologies  which connect every single virtual world.

At the core of Metamaap  is a search engine that leverages our proprietary computer vision to recognise & connect 3D assets across various virtual worlds. Using our custom blockchain Layer 3 protocols we can convert any assets both on-chain and off-chain into an interoperable asset while ensuring fast and secure transactions that provide users with complete control over their digital assets.

This platform also serves as the official metaverse mapping and authorisation platform for the metaverse council and we are responsible for assigning the metaverse ID to every web3 virtual world in the ecosystem.

With a team of experienced entrepreneurs and technology executives, We are creating innovative solutions that push the boundaries of what is possible in the virtual world. With metamaap, we are breaking down barriers and enabling a new era of interconnectedness that will revolutionize the gaming and VR industries.
                      ''',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
