import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyHome1 extends StatefulWidget {
  const MyHome1({Key? key}) : super(key: key);

  @override
  State<MyHome1> createState() => _MyHome1State();
}

class _MyHome1State extends State<MyHome1> {
  List<Map<String, dynamic>> documentsList = [];
  List<Map<String, dynamic>> displayedList = [];
  TextEditingController _searchController = TextEditingController();

  bool showMenuBar = false;

  Future<List<Map<String, dynamic>>> displayFields() async {
    List<Map<String, dynamic>> list = [];
    var data = await FirebaseFirestore.instance.collection('clientData').get();

    data.docs.forEach((doc) {
      list.add(doc.data());
    });

    return list;
  }

  @override
  void initState() {
    displayFields().then((list) {
      setState(() {
        documentsList = list;
        displayedList = List.from(documentsList);
        print(displayedList);
        // Start by showing all data
      });
    });
    _searchController.addListener(() {
      filterSearchResults(_searchController.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void filterSearchResults(String query) {
    List<Map<String, dynamic>> searchResults = [];
    if (query.isNotEmpty) {
      documentsList.forEach((item) {
        if (item["nm"].toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      });
      setState(() {
        displayedList.clear();
        displayedList.addAll(searchResults);
      });
    } else {
      setState(() {
        displayedList.clear();
        displayedList.addAll(documentsList);
      });
    }

    print(displayedList);
  }

  void _showMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final buttonRect =
        button.localToGlobal(Offset.zero, ancestor: overlay) & button.size;

    showMenu(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Color(0xff2F2F2F).withOpacity(0.95),
      context: context,
      items: <PopupMenuEntry>[
        PopupMenuItem(
          child: TextButton(
            child: Text('Add Metaverse', style: TextStyle(color: Colors.white)),
            onPressed: () {
              // Handle the button click
            },
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            child: Text('Option 1', style: TextStyle(color: Colors.white)),
            onPressed: () {
              // Handle the button click
            },
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            child: Text('Logout', style: TextStyle(color: Colors.white)),
            onPressed: () {
              // Handle the button click
            },
          ),
        ),
      ],
      position: RelativeRect.fromLTRB(
        buttonRect.right,
        buttonRect.top + 40,
        overlay.size.width - buttonRect.right,
        overlay.size.height - buttonRect.bottom,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: SafeArea(
          child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover,
                )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      showMenuBar = true;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        5.0), // Adjust this value to your needs
                                    child: Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                child: InkWell(
                                  onTap: () {
                                    _showMenu(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        5.0), // Adjust this value to your needs
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "METAMAAP",
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontFamily: 'BeVeitnamPro',
                                      letterSpacing: 10),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _searchController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.white70),
                              filled: true,
                              fillColor: Color(0xff4b4a4a),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                            ),
                          ),
                          (documentsList.length == displayedList.length)
                              ? Container()
                              : SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: ListView.builder(
                                    itemCount: displayedList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          print(
                                            displayedList[index]["nm"],
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 10.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xff4b4a4a),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.search,
                                                  color: Colors.grey),
                                              SizedBox(width: 10.0),
                                              Text(
                                                displayedList[index]["nm"],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ))
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff262626),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.pushNamed(context, "addMeta");
                        },
                        child: Text(
                          "Add Metaverse",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff262626),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    await GoogleSignIn().signOut();

                    Navigator.pushNamedAndRemoveUntil(
                        context, "home", (route) => false);
                  },
                  child: Text(
                    "LOGOUT",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          showMenuBar
              ? Container(
                  decoration:
                      BoxDecoration(color: Color(0xff2F2F2F).withOpacity(0.95)),
                  width: double.infinity,
                  height: 500,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  showMenuBar = false;
                                });
                              },
                              icon: Icon(
                                size: 26,
                                Icons.cancel,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "About",
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Metaverse Council",
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "House of krifin",
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Partners",
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Socials",
                            style: TextStyle(color: Colors.white),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.twitter,
                                  size: 28, color: Colors.white),
                              onPressed: () {
                                print("Pressed");
                              }),
                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.instagram,
                                  size: 28, color: Colors.white),
                              onPressed: () {
                                print("Pressed");
                              }),
                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.discord,
                                  size: 28, color: Colors.white),
                              onPressed: () {
                                print("Pressed");
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.telegram,
                                  size: 28, color: Colors.white),
                              onPressed: () {
                                print("Pressed");
                              }),
                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.linkedin,
                                  size: 28, color: Colors.white),
                              onPressed: () {
                                print("Pressed");
                              }),
                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.discord,
                                  size: 28, color: Colors.white),
                              onPressed: () {
                                print("Pressed");
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Teams",
                                style: TextStyle(color: Colors.white),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Privacy Policy",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      )
                    ],
                  ),
                )
              : Container(),
        ],
      )),

      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.only(left: 21, right: 21, bottom: 20),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Container(
      //         decoration: BoxDecoration(
      //           color: Color(0xff262626),
      //           borderRadius: BorderRadius.circular(12.0),
      //         ),
      //         child: IconButton(
      //             onPressed: () {},
      //             icon: Icon(
      //               Icons.search,
      //               color: Colors.white,
      //             )),
      //       ),
      //       ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             primary: Color(0xff262626),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(12.0),
      //             ),
      //           ),
      //           onPressed: () {
      //             Navigator.pushNamed(context, "connectnew");
      //           },
      //           child: Text(
      //             "CONNECT",
      //             style: TextStyle(color: Colors.white),
      //           ))
      //     ],
      //   ),
      // ),
    );
  }
}
