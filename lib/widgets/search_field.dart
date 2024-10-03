import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:brawl_store/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // Adapt background to theme
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          Icon(
            Ionicons.search,
            color: Theme.of(context).iconTheme.color, // Adapt to theme
          ),
          const SizedBox(width: 10),
          const Flexible(
            flex: 4,
            child: TextField(
              style: TextStyle(color: Colors.white), // Adapt input text color
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey), // Hint color in dark mode
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Ionicons.options_outline,
              color: Theme.of(context).iconTheme.color, // Adapt icon color to theme
            ),
          ),
        ],
      ),
    );
  }
}
