
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:brawl_store/constants.dart';
import 'package:ionicons/ionicons.dart';

class LikedClothesPage extends StatefulWidget {
  const LikedClothesPage({super.key});

  @override
  State<LikedClothesPage> createState() => _LikedClothesPageState();
}

class _LikedClothesPageState extends State<LikedClothesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Liked'),
      ),
      body: Column(
        children: [
          const SearchField(),  
          Expanded(
            child: ListView(
              children: [
                _buildClothingItemCard(
                  context,
                  'Compression Mens',
                  'assets/compression.png', 
                  'Comfortable black compression.',
                ),
                _buildClothingItemCard(
                  context,
                  'Tanktop Mens',
                  'assets/tanktop.png', 
                  'Classic mens tanktop.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClothingItemCard(
    BuildContext context, String title, String imageUrl, String description) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    imageUrl,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 10,
                  right: -1,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcontentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 5,
      ),
      child: Row(
        children: [
          const Icon(
            Ionicons.search,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
          const Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
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
            icon: const Icon(
              Ionicons.options_outline,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}