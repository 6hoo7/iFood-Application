import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/cart_page.dart';
import 'package:food_delivery_app/pages/search_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key, 
    required this.child, 
    required this.title,
    }
    );

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //Cart button
        IconButton(
        onPressed:(){
          // Đường dẫn đến trang Cart
          Navigator.push(
            context, 
          MaterialPageRoute(
            builder: (context) => const CartPage(),
            ));
        },
        icon: const Icon(Icons.shopping_cart_outlined),
        ),
        //
      ],
      
      // Thay đổi từ Text thành thanh tìm kiếm
      title: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchPage()),
          );
        },
        child: Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Theme.of(context).colorScheme.surface),
              const SizedBox(width: 8.0),
              Text(
                'Tìm kiếm...',
                style: TextStyle(color: Colors.grey[600],fontSize: 15),
              ),
            ],
          ),
        ),
      ),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 70.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0 , right: 0 , top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}