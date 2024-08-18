import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';
  List<String> products = [
    'Hamburger',
    'Salad',
    'Bánh mặn',
    'Bánh ngọt',
    'Nước',
    // Thêm các sản phẩm khác vào đây
  ];

  @override
  Widget build(BuildContext context) {
    List<String> filteredProducts = products
        .where((product) => product.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (text) {
            setState(() {
              query = text;
            });
          },
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Tìm kiếm món ăn...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredProducts[index]),
          );
        },
      ),
    );
  }
}
