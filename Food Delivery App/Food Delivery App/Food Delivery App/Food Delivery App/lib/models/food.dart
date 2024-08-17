class Food {
  final String name; // Cheese burger
  final String description; // A burger full of cheese
  final String imagePath; // lib/image/cheese_burger.png
  final double price; // 4.99
  final FoodCategory category; // Burger
  final List<Addon> availableAddons; // [extra cheese, sauce, extra patty]
  bool isFavorite; // To track if the food is favorited

  Food({
    required this.imagePath,
    required this.description,
    required this.name,
    required this.price,
    required this.availableAddons,
    required this.category,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}

// Food categories
enum FoodCategory {
  Hamburger,
  Salad,
  Banh_man,
  Banh_ngot,
  Nuoc,
}

// Food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
