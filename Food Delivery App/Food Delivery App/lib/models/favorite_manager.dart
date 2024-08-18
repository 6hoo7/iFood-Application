import 'package:food_delivery_app/models/food.dart';

class FavoriteManager {
  static final FavoriteManager _instance = FavoriteManager._internal();
  List<Food> favoriteFoods = [];

  factory FavoriteManager() {
    return _instance;
  }

  FavoriteManager._internal();

  void addFavorite(Food food) {
    if (!favoriteFoods.contains(food)) {
      favoriteFoods.add(food);
      food.isFavorite = true;
    }
  }

  void removeFavorite(Food food) {
    if (favoriteFoods.contains(food)) {
      favoriteFoods.remove(food);
      food.isFavorite = false;
    }
  }

  void clearFavorites() {
    for (var food in favoriteFoods) {
      food.isFavorite = false;
    }
    favoriteFoods.clear();
  }
}

final favoriteManager = FavoriteManager();
