import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:brawl_store/constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the current theme brightness
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // Flip colors: black in dark mode, white in light mode
    final iconColor = isDarkMode ? Colors.black : const Color.fromARGB(255, 0, 0, 0);
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            _showLogoutDialog(context, textColor);
          },
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: const EdgeInsets.all(15),
          ),
          iconSize: 30,
          icon: Icon(Ionicons.arrow_back_circle_sharp, color: iconColor),  // Icon color flips based on theme
        ),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: const EdgeInsets.all(15),
          ),
          iconSize: 30,
          icon: Icon(Ionicons.notifications_outline, color: iconColor),  // Icon color flips based on theme
        ),
      ],
    );
  }

  Future<void> _showLogoutDialog(BuildContext context, Color textColor) async {
    bool? logoutConfirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout', style: TextStyle(color: textColor)),
          content: Text('Are you sure you want to logout?', style: TextStyle(color: textColor)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            TextButton(
              child: Text('No', style: TextStyle(color: textColor)),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Yes', style: TextStyle(color: textColor)),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (logoutConfirmed ?? false) {
      Navigator.of(context).pushReplacementNamed('/loginpage2');
    }
  }
}
