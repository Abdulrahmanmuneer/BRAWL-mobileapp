import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:brawl_store/constants.dart';

class AddToCart extends StatelessWidget {
  final Function() onAdd;
  final Function() onRemove;

  const AddToCart({
    super.key,
    required this.currentNumber,
    required this.onAdd,
    required this.onRemove,
  });

  final int currentNumber;

  @override
  Widget build(BuildContext context) {
    // Get the current theme brightness
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDarkMode ? const Color.fromARGB(255, 237, 233, 233) : const Color.fromARGB(255, 202, 200, 200);
    final textColor = isDarkMode ? const Color.fromARGB(255, 244, 243, 243) : const Color.fromARGB(255, 255, 254, 254);
    final buttonColor = isDarkMode ? const Color.fromARGB(255, 37, 37, 37) : const Color.fromARGB(255, 83, 65, 110); // light grey for dark mode

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: buttonColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: onRemove,
                    iconSize: 18,
                    icon: Icon(
                      Ionicons.remove_outline,
                      color: iconColor,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    currentNumber.toString(),
                    style: TextStyle(color: textColor),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: onAdd,
                    iconSize: 18,
                    icon: Icon(
                      Ionicons.add_outline,
                      color: iconColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.circular(60),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
