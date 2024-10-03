// Import necessary packages

import 'package:brawl_store/screens/login_page2.dart';
import 'package:brawl_store/screens/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define the Authservice class
class Authservice {
  // Initialize Firebase Authentication and Firestore instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//----------------------------------------------------------------------------------------------------------------------

  // Signup function for users
  Future<void> signup({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String agerange,
    required String address,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      // Create a new user with email and password
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Retrieve the current user
      User? user = userCredential.user;

      if (user != null) {
        // Get the ID token
        String? token = await user.getIdToken();

        // Save the token locally
        //await saveToken(token!,);

        // Create a new document in Firestore with the user's data
        await _firestore.collection('users').doc(user.uid).set({
          'email': email,
          'firstname': firstname,
          'lastname': lastname,
          'agerange': agerange,
          'address': address,
          'phone': phone,
        
          'uid': user.uid,
        });

        // Save the token locally and the role
        await saveToken(token!, 'customer', user.uid);

        // Navigate to the next screen after registration
        WidgetsBinding.instance.addPostFrameCallback((_) {
         Navigator.pushReplacementNamed(context, '/mainscreen');
        });
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Authentication exceptions
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Invalid email address.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else if (e.code == 'user-disabled') {
        message = 'This user has been disabled.';
      } else if (e.code == 'too-many-requests') {
        message = 'Too many login attempts. Please try again later.';
      } else if (e.code == 'operation-not-allowed') {
        message = 'Email/password accounts are not enabled.';
      } else {
        message = e.message ?? 'An undefined error occurred.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      // Handle general exceptions
      Fluttertoast.showToast(
        msg: 'An error occurred. Please try again.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }



//----------------------------------------------------------------------------------------------------------------------
  // Signin function
  Future<void> signin({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  try {
    // Sign in with email and password
    await _auth.signInWithEmailAndPassword(email: email, password: password);

    // Retrieve the current user
    User? user = _auth.currentUser;

    if (user != null) {
      // Get the ID token
      String? token = await user.getIdToken();

      // Check the users collection
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        // User found in users collection
        String userid = userDoc['uid'];

        // Save the token locally
        await saveToken(token!, 'customer', userid);

        // Navigate to the main screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) => const MainScreen()),
        );
      } else {
        // User data not found in users collection
        Fluttertoast.showToast(
          msg: 'User  data not found.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 14.0,
        );
      }
    }
  } on FirebaseAuthException catch (e) {
    // Handle Firebase Authentication exceptions
    String message = '';
    if (e.code == 'invalid-email') {
      message = 'Invalid email address.';
    } else if (e.code == 'user-not-found') {
      message = 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      message = 'Wrong password provided for that user.';
    } else if (e.code == 'user-disabled') {
      message = 'This user has been disabled.';
    } else if (e.code == 'too-many-requests') {
      message = 'Too many login attempts. Please try again later.';
    } else if (e.code == 'operation-not-allowed') {
      message = 'Email/password accounts are not enabled.';
    } else {
      message = e.message ?? 'An undefined error occurred.';
    }
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  } catch (e) {
    // Handle general exceptions
    print('Error: $e');
    Fluttertoast.showToast(
      msg: 'An error occurred. Please try again.',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}


//----------------------------------------------------------------------------------------------------------------------

  // Recover password function
  
//----------------------------------------------------------------------------------------------------------------------

 // Signout function without notifications
Future<void> signout({required BuildContext context}) async {
  await _auth.signOut();
  clearToken();
  await Future.delayed(const Duration(seconds: 1));
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => const LoginPage2()));
}

//----------------------------------------------------------------------------------------------------------------------

  // Save token function
  Future<void> saveToken(String token, String role, String userID) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userid", userID);
    prefs.setString('auth_token', token); //saving the session token
   
  }

  // Clear token function
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.get('auth_token'));
    prefs.remove('userid');
    prefs.remove('auth_token');
    
  }
}



//--------------------------------------------------------------------------------------------------------------------------