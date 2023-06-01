import 'package:flutter/material.dart';

class AddMetaForm extends StatefulWidget {
  const AddMetaForm({Key? key}) : super(key: key);

  @override
  State<AddMetaForm> createState() => _AddMetaFormState();
}

class _AddMetaFormState extends State<AddMetaForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Your Email',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Your Metaverse/Game/Experience',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  DropdownButtonFormField<String>(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Select option',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                    items: <String>[
                      'Multiplayer Arcade Game',
                      'Fantasy World/Game',
                      'Retail/Commercial Brand Experience',
                      'Influencer/Celebrity World',
                      'Educational/Cultural Experience',
                      'Artistic Immersive Experience'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // Do something when an item is selected
                    },
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Attach one Logo of your Metaverse',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Website',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Instagram Handle link',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Please provide any link to your product',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Founder Linkedin profile link',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'First name',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Preferred first name (optional)',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Last name',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Nationality',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'City',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Twitter Handle',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Discord handle',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff555556).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  SizedBox(
                    height: 30,
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
