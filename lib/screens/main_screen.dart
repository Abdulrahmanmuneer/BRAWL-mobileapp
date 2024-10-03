import 'package:brawl_store/screens/liked_page.dart';
import 'package:brawl_store/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:brawl_store/constants.dart';
import 'package:brawl_store/screens/cart_screen.dart';
import 'package:brawl_store/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const LikedClothesPage(),
    const HomeScreen(),
    const CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Check if the current theme is dark mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentTab = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: kprimaryColor,
        child: const Icon(
          Iconsax.home,
          color: Color.fromARGB(255, 251, 248, 248),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 70,
        color: isDarkMode ? Colors.grey[850] : Colors.white, // Dark grey in dark mode, white in light mode
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentTab = 0;
                });
              },
              icon: Icon(
                Ionicons.home_outline,
                color: currentTab == 0 ? kprimaryColor : (isDarkMode ? Colors.white : Colors.grey.shade400),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentTab = 1;
                });
              },
              icon: Icon(
                Ionicons.heart_outline,
                color: currentTab == 1 ? kprimaryColor : (isDarkMode ? Colors.white : Colors.grey.shade400),
              ),
            ),
            const SizedBox(width: 40),
            IconButton(
              onPressed: () {
                setState(() {
                  currentTab = 3;
                });
              },
              icon: Icon(
                Ionicons.cart_outline,
                color: currentTab == 3 ? kprimaryColor : (isDarkMode ? Colors.white : Colors.grey.shade400),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentTab = 4;
                });
              },
              icon: Icon(
                Ionicons.person_outline,
                color: currentTab == 4 ? kprimaryColor : (isDarkMode ? Colors.white : Colors.grey.shade400),
              ),
            ),
          ],
        ),
      ),
      body: screens[currentTab],
    );
  }
}
