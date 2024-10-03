import 'package:flutter/material.dart';
import 'package:brawl_store/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the current theme brightness
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      categories[index].image,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                categories[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,  // Dynamic text color
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: categories.length,
      ),
    );
  }
}
