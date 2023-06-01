import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: SafeArea(
          child: Stack(
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
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
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
                      fillColor: Color(0xff555556),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                    ),
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
