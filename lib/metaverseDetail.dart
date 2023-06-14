import 'package:flutter/material.dart';

class MetaverseDetail extends StatefulWidget {
  const MetaverseDetail({Key? key}) : super(key: key);

  @override
  State<MetaverseDetail> createState() => _MetaverseDetailState();
}

class _MetaverseDetailState extends State<MetaverseDetail> {
  List<String> imageUrls = [
    'https://pbs.twimg.com/media/FKhwNrFWYAEaaDQ.jpg:large',
    'https://pbs.twimg.com/media/FKhwNrFWYAEaaDQ.jpg:large',
    'https://pbs.twimg.com/media/FKhwNrFWYAEaaDQ.jpg:large',
    'https://pbs.twimg.com/media/FKhwNrFWYAEaaDQ.jpg:large'
  ];

  var coverImageList = [
    'https://pbs.twimg.com/media/FKhwNrFWYAEaaDQ.jpg:large',
    'https://mediapool.bmwgroup.com/cache/P9/202301/P90492224/P90492224-bmw-group-supplierthon-for-the-metaverse-and-other-virtual-experiences-01-2023-1680px.jpg',
    'https://www.bostonglobe.com/resizer/YpOXRh3x-QuRFK_wgmr86eny6WM=/arc-anglerfish-arc2-prod-bostonglobe/public/N7YPWXJCVVFWXNO55WWBZDINV4.JPG',
    'https://img.bfmtv.com/c/0/0/af7/11f694c76cbd83569dfea09a18da9.jpg'
  ];

  var mostPopularImageList = [
    'https://pbs.twimg.com/media/FKhwNrFWYAEaaDQ.jpg:large',
    'https://mediapool.bmwgroup.com/cache/P9/202301/P90492224/P90492224-bmw-group-supplierthon-for-the-metaverse-and-other-virtual-experiences-01-2023-1680px.jpg',
    'https://www.bostonglobe.com/resizer/YpOXRh3x-QuRFK_wgmr86eny6WM=/arc-anglerfish-arc2-prod-bostonglobe/public/N7YPWXJCVVFWXNO55WWBZDINV4.JPG',
    'https://img.bfmtv.com/c/0/0/af7/11f694c76cbd83569dfea09a18da9.jpg'
  ];

  int coverIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      image: NetworkImage(coverImageList[coverIndex]),
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
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (coverIndex > 0) {
                                coverIndex--;
                              } else {
                                coverIndex = coverImageList.length - 1;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                            color: Color(0xff767683),
                          )),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageUrls.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 2.0),
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    coverImageList[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  coverIndex = index;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (coverIndex < coverImageList.length - 1) {
                                coverIndex++;
                              } else {
                                coverIndex = 0;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Color(0xff767683),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MOST POPULAR",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'BeVeitnamPro',
                            letterSpacing: 8),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mostPopularImageList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: DecorationImage(
                                  image:
                                      NetworkImage(mostPopularImageList[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MY WORLD",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'BeVeitnamPro',
                            letterSpacing: 8),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100, // Set this to the desired height
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mostPopularImageList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                image: DecorationImage(
                                  image:
                                      NetworkImage(mostPopularImageList[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MY ASSETS",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'BeVeitnamPro',
                            letterSpacing: 8),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70, // Set this to the desired height
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mostPopularImageList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 70.0,
                              height: 70.0,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2.0),
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  mostPopularImageList[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
