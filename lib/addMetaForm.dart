import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMetaForm extends StatefulWidget {
  const AddMetaForm({Key? key}) : super(key: key);

  @override
  State<AddMetaForm> createState() => _AddMetaFormState();
}

class _AddMetaFormState extends State<AddMetaForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _metaController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _logoController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _linkToProductController =
      TextEditingController();
  final TextEditingController _linkedInController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _preferredNameController =
      TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _twitterController = TextEditingController();
  final TextEditingController _discordController = TextEditingController();
  List<bool> checkboxValues = List.generate(10, (index) => false);
  List<String> labels = [
    'Networking opportunity',
    'Metaverse asset research center',
    'CAMLab',
    'HR support',
    'Technical Development support',
    'Grant & Investor Access',
    'Marketing & Promotion support',
    'Industry Insights & report',
    'Policy advocacy',
    'Other',
  ];
  String? dropdownValue = 'Multiplayer Arcade Game';
  bool disclaimerAccepted = false;
  void saveDataToFirestore() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM d, yyyy at h:mm:s a O').format(now);

    final user = FirebaseAuth.instance.currentUser;
    String uid = user != null ? user.uid : '';

    List<String> selectedOptions = [];
    for (int i = 0; i < checkboxValues.length; i++) {
      if (checkboxValues[i]) {
        selectedOptions.add(labels[i]);
      }
    }

    String isDisclaimerAccepted;
    if (disclaimerAccepted) {
      isDisclaimerAccepted = "Yes";
    } else {
      isDisclaimerAccepted = "No";
    }
    Map<String, dynamic> data = {
      'updatedAt': formattedDate,
      'description': _descriptionController.text,
      'category': dropdownValue,
      'interests': selectedOptions,
      'city': _cityController.text,
      'demo': _linkToProductController.text,
      'discord': _discordController.text,
      'email': _emailController.text,
      'firstName': _nameController.text,
      'image': _imageController.text,
      'instagram': _instagramController.text,
      'lastName': _lastNameController.text,
      'linkedin': _linkedInController.text,
      'logo': _logoController.text,
      'name': _metaController.text,
      'nationality': _nationalityController.text,
      'phone': _phoneNumberController.text,
      'preferredName': _preferredNameController.text,
      'twitter': _twitterController.text,
      'website': _websiteController.text,
      'updatedBy': uid,
      'disclaimer': isDisclaimerAccepted,
    };

    print(data);

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('metaverses').add(data);
    _emailController.clear();
    _metaController.clear();
    _descriptionController.clear();
    _logoController.clear();
    _imageController.clear();
    _websiteController.clear();
    _instagramController.clear();
    _linkToProductController.clear();
    _linkedInController.clear();
    _nameController.clear();
    _preferredNameController.clear();
    _lastNameController.clear();
    _phoneNumberController.clear();
    _nationalityController.clear();
    _cityController.clear();
    _twitterController.clear();
    _discordController.clear();
    Navigator.pushNamedAndRemoveUntil(context, "home1", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
                margin: EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Your Email',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _metaController,
                        decoration: InputDecoration(
                          hintText: 'Your Metaverse/Game/Experience',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      DropdownButtonFormField<String>(
                        value: dropdownValue,
                        dropdownColor: Colors.black,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
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
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _logoController,
                        decoration: InputDecoration(
                          hintText: 'Attach one Logo of your Metaverse',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _imageController,
                        decoration: InputDecoration(
                          hintText: 'Attach one image of your Metaverse',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _websiteController,
                        decoration: InputDecoration(
                          hintText: 'Website',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _instagramController,
                        decoration: InputDecoration(
                          hintText: 'Instagram Handle link',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _linkToProductController,
                        decoration: InputDecoration(
                          hintText: 'Please provide any link to your product',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _linkedInController,
                        decoration: InputDecoration(
                          hintText: 'Founder Linkedin profile link',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'First name',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _preferredNameController,
                        decoration: InputDecoration(
                          hintText: 'Preferred first name (optional)',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          hintText: 'Last name',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          hintText: 'Phone number',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _nationalityController,
                        decoration: InputDecoration(
                          hintText: 'Nationality',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _cityController,
                        decoration: InputDecoration(
                          hintText: 'City',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          decoration: BoxDecoration(
                            color: Color(0xff555556).withOpacity(0.5),
                            border: Border.all(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'What interests you about Metaverse Council ?',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Column(
                                children: List<Widget>.generate(
                                  checkboxValues.length,
                                  (index) => Row(
                                    children: [
                                      Transform.scale(
                                        scale: 0.8,
                                        child: Checkbox(
                                          checkColor: Color(0xff555556),
                                          activeColor: Color(0xff555556),
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return Colors.white;
                                            }
                                            return Colors.white;
                                          }),
                                          value: checkboxValues[index],
                                          onChanged: (newValue) {
                                            setState(() {
                                              checkboxValues[index] = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                      Text(
                                        labels[index],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _twitterController,
                        decoration: InputDecoration(
                          hintText: 'Twitter Handle',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _discordController,
                        decoration: InputDecoration(
                          hintText: 'Discord handle',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff555556).withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20.0),
                        decoration: BoxDecoration(
                          color: Color(0xff555556).withOpacity(0.5),
                          border: Border.all(color: Colors.white, width: 0.5),
                          borderRadius: BorderRadius.circular(27.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Disclaimer',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            SingleChildScrollView(
                              child: Text(
                                'Our Foundation is committed to protecting and respecting your privacy, and we’ll only use your personal information to administer your account and to provide the products and services you requested from us. From time to time, we would like to contact you about our products, as well as other content that may be of interest to you.\n\n'
                                'You agree to having the data provided processed for the legitimate purpose of the Metaverse Ambassadors Program and receiving communication by Metaverse Council.\n\n'
                                'You also agree that Metaverse Council has the right to make determinations concerning grants at its sole and absolute discretion, and that Metaverse Council is under no obligation to offer you a grant;\n\n'
                                'You can unsubscribe from these communications at any time with the unsubscribe link provided in each communication sent to you.\n\n'
                                'By clicking submit below, you consent to allow our Foundation to store and process the personal information submitted above to provide you the content requested.',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 14),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 0.8,
                                  child: Checkbox(
                                    checkColor: Color(0xff555556),
                                    activeColor: Color(0xff555556),
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return Colors.white;
                                      }
                                      return Colors.white;
                                    }),
                                    value: disclaimerAccepted,
                                    onChanged: (newValue) {
                                      setState(() {
                                        disclaimerAccepted = newValue!;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'I accept the disclaimer',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                            if (_formKey.currentState!.validate()) {
                              saveDataToFirestore();
                            }
                          },
                          child: Text('Submit'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
