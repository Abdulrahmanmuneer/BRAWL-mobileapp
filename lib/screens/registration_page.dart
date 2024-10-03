import 'package:flutter/material.dart';
import 'package:brawl_store/Services/AuthService.dart'; // Import the AuthService class

class RegistrationPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageRangeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine text color based on the theme mode
    Color textColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/loginpage2');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              style: TextStyle(color: textColor), // Set text color
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              style: TextStyle(color: textColor), // Set text color
            ),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
              style: TextStyle(color: textColor), // Set text color
            ),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
              ),
              style: TextStyle(color: textColor), // Set text color
            ),
            TextFormField(
              controller: ageRangeController,
              decoration: const InputDecoration(
                labelText: 'Age Range',
              ),
              style: TextStyle(color: textColor), // Set text color
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
              style: TextStyle(color: textColor), // Set text color
            ),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
              style: TextStyle(color: textColor), // Set text color
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await Authservice().signup(
                  email: emailController.text,
                  password: passwordController.text,
                  firstname: firstNameController.text,
                  lastname: lastNameController.text,
                  agerange: ageRangeController.text,
                  address: addressController.text,
                  phone: phoneController.text,
                  context: context,
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
