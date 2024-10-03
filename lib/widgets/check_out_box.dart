import 'package:flutter/material.dart';
import 'package:brawl_store/constants.dart';
import 'package:brawl_store/models/cart_item.dart';

class CheckOutBox extends StatelessWidget {
  final List<CartItem> items;

  const CheckOutBox({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the current theme is dark mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black : Colors.white, // Set to black in dark mode
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        border: Border.all(
          color: Colors.white, // White outline
          width: 2, // Width of the outline
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              filled: true,
              fillColor: kcontentColor,
              hintText: "Enter Discount Code",
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? const Color.fromARGB(179, 4, 3, 3) : Colors.grey, // Adjust hint color
              ),
              suffixIcon: TextButton(
                onPressed: () {},
                child: const Text(
                  "Apply",
                  style: TextStyle(
                    color: kprimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Subtotal",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey, // Change this color if you want it different in dark mode
                ),
              ),
              Text(
                "\$${items.length > 1 ? items.map<double>((e) => e.quantity * e.product.price).reduce((value1, value2) => value1 + value2) : items[0].product.price * items[0].quantity}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black, // Adjust subtotal color
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.grey), // Optionally change divider color for dark mode
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey, // Change this color if you want it different in dark mode
                ),
              ),
              Text(
                "\$${items.length > 1 ? items.map<double>((e) => e.quantity * e.product.price).reduce((value1, value2) => value1 + value2) : items[0].product.price * items[0].quantity}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black, // Adjust total color
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kprimaryColor,
              minimumSize: const Size(double.infinity, 55),
            ),
            child: const Text(
              "Check out",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, // Keep button text white
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
