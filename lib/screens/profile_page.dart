import 'dart:io';

import 'package:brawl_store/screens/edit_personal_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _email = '';
  String _firstname = '';
  String _lastname = '';
  String? _profilePicture;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final doc = await _firestore.collection('users').doc(user?.uid).get();
    final userData = doc.data();

    setState(() {
      _email = userData?['email'];
      _firstname = userData?['firstname'];
      _lastname = userData?['lastname'];
    });
  }

  Future<void> _uploadProfilePicture(String imagePath) async {
    // Implement the logic to upload the profile picture to your server or storage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _profilePicture != null
                        ? FileImage(File(_profilePicture!))
                        : const AssetImage('assets/me.png'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$_firstname $_lastname',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _email,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Update personal info',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditPersonalInfo()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_rounded),
              title: Text(
                'Upload Profile Picture',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Upload Profile Picture'),
                      content: Text('Choose a method to upload your profile picture'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final image = await ImagePicker().pickImage(source: ImageSource.camera);
                            if (image != null) {
                              await _uploadProfilePicture(image.path);
                              setState(() {
                                _profilePicture = image.path;
                              });
                            }
                            Navigator.pop(context);
                          },
                          child: Text('Camera'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              await _uploadProfilePicture(image.path);
                              setState(() {
                                _profilePicture = image.path;
                              });
                            }
                            Navigator.pop(context);
                          },
                          child: Text('Gallery'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(
                'Enable Notifications',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                // TODO: implement enable notifications functionality
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text(
                'About',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                // TODO: implement about functionality
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text(
                'Delete Account',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Confirm Deletion'),
                      content: Text('Are you sure you want to delete your account?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context );
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final user = FirebaseAuth.instance.currentUser;
                            await _firestore.collection('users').doc(user?.uid).delete();
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/loginpage2',
                              (route) => false,
                            );
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/loginpage2', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}