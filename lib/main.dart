import 'package:brawl_store/screens/main_screen.dart';
import 'package:brawl_store/screens/login_page2.dart';
import 'package:brawl_store/screens/onboarding_page1.dart';
import 'package:brawl_store/screens/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:brawl_store/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';  // Firebase Core import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.light().copyWith(
        primaryColor: Colors.grey[400],
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 13, 9, 9),
        scaffoldBackgroundColor: const Color.fromARGB(255, 16, 13, 13),
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: const Color.fromARGB(255, 5, 5, 5),
        ),
      ),

      home: const OnboardingPage1(),
      routes: {
        '/loginpage2': (context) => const LoginPage2(),
        '/homepage': (context) => const HomeScreen(),
        '/mainscreen': (context) => const MainScreen(),
        '/onboardingpage': (context) => const OnboardingPage1(),
        '/registrationpage': (context) => RegistrationPage(),
      },
    );
  }
}
