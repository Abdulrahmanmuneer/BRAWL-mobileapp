import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currentImage;
  final String image;

  const ImageSlider({
    super.key,
    required this.onChange,
    required this.currentImage,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the current theme is dark mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: 5,
        onPageChanged: onChange,
        itemBuilder: (context, index) {
          return Container(
            color: isDarkMode ? Colors.grey : Colors.transparent, // Set grey background in dark mode
            alignment: Alignment.center, // Center the image within the container
            child: Image.asset(image), // Use the image without resizing
          );
        },
      ),
    );
  }
}
