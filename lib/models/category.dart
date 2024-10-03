class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  Category(title: "Hoodies", image: "assets/hoodie.png"),
  Category(title: "Trackers", image: "assets/trackers.png"),
  Category(title: "Boxers", image: "assets/boxers.png"),
  Category(title: "Compressions", image: "assets/compression.png"),
  Category(title: "Tanktops", image: "assets/tanktop.png"),
];
