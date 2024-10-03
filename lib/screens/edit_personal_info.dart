import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditPersonalInfo extends StatefulWidget {
  @override
  _EditPersonalInfoState createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageRangeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = _auth.currentUser;
    final doc = await _firestore.collection('users').doc(user?.uid).get();
    final userData = doc.data();

    setState(() {
      emailController.text = userData?['email'];
      firstNameController.text = userData?['firstname'];
      lastNameController.text = userData?['lastname'];
      ageRangeController.text = userData?['agerange'];
      addressController.text = userData?['address'];
      phoneController.text = userData?['phone'];
    });
  }

  Future<void> _updateUserData() async {
    final user = _auth.currentUser;
    await _firestore.collection('users').doc(user?.uid).update({
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'agerange': ageRangeController.text,
      'address': addressController.text,
      'phone': phoneController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Update successful!'),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Personal Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              enabled: false, // Make the email field unchangeable
            ),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            TextFormField(
              controller: ageRangeController,
              decoration: const InputDecoration(
                labelText: 'Age Range',
              ),
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
            ),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateUserData,
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}