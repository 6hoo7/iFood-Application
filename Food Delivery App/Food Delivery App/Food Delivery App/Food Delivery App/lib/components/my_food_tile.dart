// import 'package:flutter/material.dart';
// import '../models/food.dart';
// import '../models/favorite_manager.dart'; // Import FavoriteManager

// class FoodTile extends StatelessWidget {
//   final Food food;
//   final void Function()? onTap;
//   final void Function()? onFavoriteTap;

//   const FoodTile({
//     super.key,
//     required this.food,
//     required this.onTap,
//     required this.onFavoriteTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Row(
//               // Thông tin món ăn
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(food.name),
//                       Text(
//                         '${food.price} VND',
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.primary,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         food.description,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.inversePrimary,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//                 // Hình ảnh món ăn với icon favorite
//                 Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.asset(food.imagePath, height: 120),
//                     ),
//                     Positioned(
//                       top: 8,
//                       right: 8,
//                       child: GestureDetector(
//                         onTap: () {
//                           food.toggleFavorite();
//                           if (food.isFavorite) {
//                             favoriteManager.addFavorite(food);
//                           } else {
//                             favoriteManager.removeFavorite(food);
//                           }
//                           onFavoriteTap?.call();
//                         },
//                         child: Icon(
//                           food.isFavorite ? Icons.favorite : Icons.favorite_border,
//                           color: food.isFavorite ? Colors.red : Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         // Đường kẻ chia
//         const Divider(
//           color: Colors.black,
//           endIndent: 25,
//           indent: 25,
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/food.dart';
import '../models/favorite_manager.dart'; // Import FavoriteManager

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  final void Function()? onFavoriteTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              // Thông tin món ăn
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        '${food.price} VND',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        food.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                // Hình ảnh món ăn với icon favorite
                Stack(
                  children: [
                    Container(
                      width: 120, // Đặt chiều rộng cho hình vuông
                      height: 120, // Đặt chiều cao cho hình vuông
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(food.imagePath),
                          fit: BoxFit
                              .cover, // Đảm bảo hình ảnh phủ toàn bộ khu vực
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          food.toggleFavorite();
                          if (food.isFavorite) {
                            favoriteManager.addFavorite(food);
                          } else {
                            favoriteManager.removeFavorite(food);
                          }
                          onFavoriteTap?.call();
                        },
                        child: Icon(
                          food.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: food.isFavorite ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Đường kẻ chia
        const Divider(
          color: Colors.black,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
