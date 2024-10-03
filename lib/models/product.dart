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
    description:
        "Step into unparalleled comfort and effortless style with our Men's Oversized T-Shirt. Crafted from a premium blend of soft cotton and durable polyester, this tee offers a relaxed fit that drapes perfectly on any body type. Ideal for lounging, casual outings, or layering, it ensures you look cool and feel comfortable all day long.",
    image: "assets/oversized.png",
    price: 120,
    colors: [
      Colors.black,
      Colors.blue,
      Colors.orange,
    ],

    category: "T shirt",
    rate: 4.8,
  ),
  Product(
    title: "Womans Yoga Pants",
    description:
        "Experience ultimate comfort and style with our premium Women's Yoga Pants. Designed to provide optimal support and flexibility, these pants are perfect for yoga, pilates, running, or any other workout. Crafted from a high-quality blend of spandex and polyester, they offer a soft, breathable, and moisture-wicking fabric that keeps you cool and dry throughout your session..",
    image: "assets/yoga.jpg",
    price: 120,
    colors: [
      Colors.brown,
      Colors.red,
      Colors.pink,
    ],
    category: "Woman Fitness",
    rate: 4.2,
  ),
  Product(
    title: "Unisex Socks",
    description:
        "Introducing our premium unisex sports socks, designed for ultimate comfort and performance. Made from a breathable, moisture-wicking fabric blend, these socks keep your feet dry and cool during the most intense workouts. Featuring cushioned soles and arch support, they provide maximum comfort and reduce fatigue. The seamless toe design minimizes friction, preventing blisters and ensuring a snug fit.",
    image: "assets/socks.png",
    price: 55,
    colors: [
      Colors.black,
    ],
    category: "Foot wear",
    rate: 3.9,
  ),
];
