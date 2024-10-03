// ignore_for_file: duplicate_import

import 'package:brawl_store/constants.dart';
import 'package:brawl_store/models/cart_item.dart';
import 'package:brawl_store/widgets/check_out_box.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:brawl_store/widgets/cart_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // Check if the current theme is dark mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : kcontentColor, // Black in dark mode
        title: Center(
          child: Text(
            "My Cart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : const Color.fromARGB(255, 0, 0, 0), // White in dark mode, black in light mode
            ),
          ),
        ),
        automaticallyImplyLeading: false, // Remove the back arrow
      ),
      bottomSheet: CheckOutBox(
        items: cartItems,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) => CartTile(
          item: cartItems[index],
          onRemove: () {
            if (cartItems[index].quantity != 1) {
              setState(() {
                cartItems[index].quantity--;
              });
            }
          },
          onAdd: () {
            setState(() {
              cartItems[index].quantity++;
            });
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: cartItems.length,
      ),
    );
  }
}
