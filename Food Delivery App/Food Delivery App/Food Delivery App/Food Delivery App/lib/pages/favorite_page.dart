// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/components/my_cart_tile2.dart';
// import '../models/food.dart';
// import '../models/favorite_manager.dart'; // Import FavoriteManager

// class FavoritePage extends StatefulWidget {
//   const FavoritePage({super.key, required List favoriteFoods});

//   @override
//   State<FavoritePage> createState() => _FavoritePageState();
// }

// class _FavoritePageState extends State<FavoritePage> {
//   late List<Food> favoriteFoods;

//   @override
//   void initState() {
//     super.initState();
//     favoriteFoods = favoriteManager.favoriteFoods;
//   }

//   void _clearFavorites() {
//     setState(() {
//       favoriteManager.clearFavorites();
//       favoriteFoods = favoriteManager.favoriteFoods;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Yêu thích",
//           style: TextStyle(
//             fontSize: 20, // Tăng kích thước chữ
//             fontWeight: FontWeight.bold, // Làm chữ đậm
//           ),
//          ),
//         centerTitle: true,
//         backgroundColor: Theme.of(context).colorScheme.surface,
//         actions: [
//           // clear favorites button
//           IconButton(
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: const Text("Bạn có chắc chắn muốn xóa tất cả yêu thích không?"),
//                   actions: [
//                     // cancel button
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text("Hủy"),
//                     ),
//                     // yes button
//                     TextButton(
//                       onPressed: () {
//                         _clearFavorites();
//                         Navigator.pop(context);
//                       },
//                       child: const Text("Đồng ý"),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             icon: const Icon(Icons.delete),
//           ),
//         ],
//       ),

//       body: favoriteFoods.isEmpty
//           ? const Center(child: Text("Không có món ăn yêu thích."))
//           : ListView.builder(
//               itemCount: favoriteFoods.length,
//               itemBuilder: (context, index) {
//                 final food = favoriteFoods[index];
//                 return MyCartTile2(
//                   food: food,
//                   onRemove: () {
//                     setState(() {
//                       favoriteManager.removeFavorite(food);
//                       favoriteFoods = favoriteManager.favoriteFoods;
//                     });
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_cart_tile2.dart';
import '../models/food.dart';
import '../models/favorite_manager.dart'; // Import FavoriteManager

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key, required List<Food> favoriteFoods});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late List<Food> favoriteFoods;

  @override
  void initState() {
    super.initState();
    favoriteFoods = favoriteManager.favoriteFoods;
  }

  void _clearFavorites() {
    setState(() {
      favoriteManager.clearFavorites();
      favoriteFoods = favoriteManager.favoriteFoods;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Yêu thích",
          style: TextStyle(
            fontSize: 20, // Tăng kích thước chữ
            fontWeight: FontWeight.bold, // Làm chữ đậm
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false, // Ngăn tự động thêm nút back
        leading: SizedBox.shrink(), // Sử dụng SizedBox để không có icon
        actions: [
          // clear favorites button
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                      "Bạn có chắc chắn muốn xóa tất cả yêu thích không?"),
                  actions: [
                    // cancel button
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Hủy"),
                    ),
                    // yes button
                    TextButton(
                      onPressed: () {
                        _clearFavorites();
                        Navigator.pop(context);
                      },
                      child: const Text("Đồng ý"),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: favoriteFoods.isEmpty
          ? const Center(child: Text("Không có món ăn yêu thích."))
          : ListView.builder(
              itemCount: favoriteFoods.length,
              itemBuilder: (context, index) {
                final food = favoriteFoods[index];
                return MyCartTile2(
                  food: food,
                  onRemove: () {
                    setState(() {
                      favoriteManager.removeFavorite(food);
                      favoriteFoods = favoriteManager.favoriteFoods;
                    });
                  },
                );
              },
            ),
    );
  }
}
