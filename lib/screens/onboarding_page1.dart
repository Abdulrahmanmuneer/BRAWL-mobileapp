import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 1, 0, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 249, 247, 247),
                  foregroundColor: const Color.fromARGB(255, 17, 11, 11),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Get Started'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/loginpage2');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}