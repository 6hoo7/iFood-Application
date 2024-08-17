import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer.dart';
import 'package:food_delivery_app/pages/list_category.dart';
import 'package:food_delivery_app/pages/product_manager_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text(
          "Quản trị viên",
          style: TextStyle(
            fontSize: 20, // Tăng kích thước chữ
            fontWeight: FontWeight.bold, // Làm chữ đậm
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      drawer: MyDrawer(), // Thêm MyDrawer vào Scaffold
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildGridTile(
              'Quản lý tài khoản người dùng',
              Icons.account_circle,
              () {},
            ),
            _buildGridTile(
              'Quản lý sản phẩm',
              Icons.shopping_bag,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductManagementPage(),
                  ),
                );
              },
            ),
            _buildGridTile('Quản lý doanh thu', Icons.attach_money, () {}),
            _buildGridTile(
              'Quản lý danh mục',
              Icons.category,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListCategoryPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridTile(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
