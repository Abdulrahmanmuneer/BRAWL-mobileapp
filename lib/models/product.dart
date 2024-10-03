import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final double price;
  final List<Color> colors;
  final String category;
  final double rate;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.colors,
    required this.category,
    required this.rate,
  });
}

final List<Product> products = [
  Product(
    title: "Unisex Oversized t",
    description: "Step into unparalleled comfort and effortless style...",
    image: "assets/oversized.png",
    price: 120,
    colors: [Colors.black, Colors.blue, Colors.orange],
    category: "T shirt",
    rate: 4.8,
  ),
  Product(
    title: "Womans Yoga Pants",
    description: "Experience ultimate comfort and style...",
    image: "assets/yoga.jpg",
    price: 120,
    colors: [Colors.brown, Colors.red, Colors.pink],
    category: "Woman Fitness",
    rate: 4.2,
  ),
  Product(
    title: "Unisex Socks",
    description: "Introducing our premium unisex sports socks...",
    image: "assets/socks.png",
    price: 55,
    colors: [Colors.black],
    category: "Foot wear",
    rate: 3.9,
  ),
  // Additional Products
  Product(
    title: "Men's Sports Shoes",
    description: "High-performance sports shoes with optimal grip...",
    image: "assets/shoes.png",
    price: 180,
    colors: [Colors.grey, Colors.blue],
    category: "Foot wear",
    rate: 4.5,
  ),
  Product(
    title: "Stylish Sunglasses",
    description: "Protect your eyes in style with our premium sunglasses...",
    image: "assets/sunglasses.png",
    price: 70,
    colors: [Colors.black, Colors.grey],
    category: "Accessories",
    rate: 4.0,
  ),
  Product(
    title: "Leather Wallet",
    description: "Compact and sleek leather wallet with ample storage...",
    image: "assets/wallet.png",
    price: 50,
    colors: [Colors.brown, Colors.black],
    category: "Accessories",
    rate: 4.3,
  ),
  Product(
    title: "Fitness Tracker",
    description: "Track your fitness goals with this stylish and functional tracker...",
    image: "assets/miband.jpg",
    price: 150,
    colors: [Colors.black, Colors.green],
    category: "Electronics",
    rate: 4.7,
  ),
  Product(
    title: "Casual Backpack",
    description: "A durable, lightweight backpack perfect for everyday use...",
    image: "assets/backpack.png",
    price: 85,
    colors: [Colors.blue, Colors.grey],
    category: "Accessories",
    rate: 4.4,
  ),
];
