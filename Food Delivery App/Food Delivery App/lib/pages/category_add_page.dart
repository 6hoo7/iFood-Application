import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/api_service.dart'; // Đảm bảo import ApiService

class CategoryAddPage extends StatefulWidget {
  const CategoryAddPage({super.key});

  @override
  State<CategoryAddPage> createState() => _CategoryAddPageState();
}

class _CategoryAddPageState extends State<CategoryAddPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final ApiService apiService = ApiService(); // Khởi tạo ApiService

  void _saveCategory() async {
    final name = _nameController.text;
    final description = _desController.text;

    if (name.isEmpty || description.isEmpty) {
      // Hiển thị thông báo lỗi nếu dữ liệu không hợp lệ
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin!')),
      );
      return;
    }

    try {
      await apiService.createCategory(name, description);
      // Hiển thị thông báo thành công và quay lại trang trước
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Loại sản phẩm đã tạo thành công!')),
      );
      Navigator.of(context).pop(); // Quay lại trang trước khi thành công
    } catch (error) {
      // Hiển thị thông báo lỗi nếu tạo danh mục không thành công
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lỗi khi tạo danh mục')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thêm loại sản phẩm",
          style: TextStyle(
            fontSize: 20, // Tăng kích thước chữ
            fontWeight: FontWeight.bold, // Làm chữ đậm
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tên loại sản phẩm",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: "Nhập tên loại sản phẩm",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Mô tả",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _desController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập mô tả loại sản phẩm',
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: MyButton(
                text: "Lưu",
                onTap: _saveCategory, // Gọi phương thức lưu danh mục
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
