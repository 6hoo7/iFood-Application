// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/components/my_button.dart';
// import 'package:food_delivery_app/components/my_cart_tile.dart';
// import 'package:food_delivery_app/models/restaurant.dart';
// import 'package:food_delivery_app/pages/payment_page.dart';
// import 'package:provider/provider.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Restaurant>(builder:(context,restaurant,child){
//       //cart
//       final userCart =restaurant.cart;

//       // scaffold UI
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//           "Giỏ hàng",
//           style: TextStyle(
//             fontSize: 20, // Tăng kích thước chữ
//             fontWeight: FontWeight.bold, // Làm chữ đậm
//           ),
//          ),
//           centerTitle: true,
//         backgroundColor: Theme.of(context).colorScheme.surface,
//         actions: [
//           // clear cart button
//           IconButton(
//             onPressed: (){
//               showDialog(
//                 context: context,
//                  builder: (context)=> AlertDialog(
//                   title: const Text("Bạn có chắc chắn muốn xóa giỏ hàng không?"),
//                   actions: [
//                     // cancel button
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                        child: const Text("Hủy")),
//                     // yes button
//                     TextButton(
//                       onPressed: () {
//                          Navigator.pop(context);
//                        restaurant.clearCart();

//             },
//             child: const Text("Đồng ý"),
//                     ),
//                   ],
//                  )
//                  );
//             },
//             icon: const Icon(Icons.delete),
//             )
//         ],
//         ),
//         body: Column(
//           children: [
//             // list of cart
//             Expanded(
//               child: Column(
//                 children: [
//                   userCart.isEmpty
//                   ? const Expanded(
//                     child:Center(
//                     child:  Text("Giỏ hàng của bạn đang trống..")
//                     ),
//                   )
//                 : Expanded(
//                   child: ListView.builder(
//                   itemCount: userCart.length,
//                   itemBuilder: (contex,index ) {
//                     // get individual cart item
//                     final cartItem = userCart[index];

//                     // return cart tile UI
//                     return MyCartTile(cartItem: cartItem);

//                   },
//                   ),
//                   ),

//               ],
//               ),
//             ),
//             // button to play
//             MyButton(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const PaymentPage(),
//             ),
//             ),
//             text: "Thanh toán"),
//             const SizedBox(height: 25),
//           ],
//         ),
//         );
//     }
//   );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      // Cart
      final userCart = restaurant.cart;

      // Scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Giỏ hàng",
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
            // Clear cart button
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title:
                        const Text("Bạn có chắc chắn muốn xóa giỏ hàng không?"),
                    actions: [
                      // Cancel button
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Hủy"),
                      ),
                      // Yes button
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.clearCart();
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
        body: Column(
          children: [
            // List of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(
                            child: Text("Giỏ hàng của bạn đang trống."),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              // Get individual cart item
                              final cartItem = userCart[index];

                              // Return cart tile UI
                              return MyCartTile(cartItem: cartItem);
                            },
                          ),
                        ),
                ],
              ),
            ),
            // Button to pay
            MyButton(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentPage(),
                ),
              ),
              text: "Thanh toán",
            ),
            const SizedBox(height: 25),
          ],
        ),
      );
    });
  }
}
