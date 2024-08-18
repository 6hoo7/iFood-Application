import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/api_service.dart';
import 'package:food_delivery_app/pages/category_add_page.dart';

class ListCategoryPage extends StatefulWidget {
  const ListCategoryPage({super.key});

  @override
  State<ListCategoryPage> createState() => _ListCategoryPageState();
}

class _ListCategoryPageState extends State<ListCategoryPage> {
  final ApiService apiService = ApiService(); // Khởi tạo ApiService
  late Future<List<dynamic>> _categories;

  @override
  void initState() {
    super.initState();
    _categories =
        apiService.getAllCategories(); // Lấy danh sách loại sản phẩm từ API
  }

  void _deleteCategory(String categoryId) async {
    try {
      await apiService.deleteCategory(categoryId);
      setState(() {
        _categories =
            apiService.getAllCategories(); // Cập nhật danh sách sau khi xóa
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lỗi khi xóa loại sản phẩm')),
      );
    }
  }

  void _showEditDialog(dynamic category) {
    final TextEditingController nameController =
        TextEditingController(text: category['name']);
    final TextEditingController descriptionController =
        TextEditingController(text: category['description']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Chỉnh sửa loại sản phẩm'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tên loại sản phẩm'),
                TextField(
                  controller: nameController,
                  decoration:
                      const InputDecoration(hintText: "Nhập tên loại sản phẩm"),
                ),
                const SizedBox(height: 10),
                const Text('Mô tả'),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      hintText: "Nhập mô tả loại sản phẩm"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () async {
                final updatedCategory = {
                  'name': nameController.text,
                  'description': descriptionController.text,
                };

                try {
                  await apiService.updateCategory(
                      category['_id'], updatedCategory);
                  setState(() {
                    _categories = apiService
                        .getAllCategories(); // Cập nhật danh sách sau khi sửa
                  });
                  Navigator.of(context).pop();
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Lỗi khi cập nhật loại sản phẩm')),
                  );
                }
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Danh sách loại sản phẩm",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _categories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Không có loại sản phẩm nào'));
          }

          final categories = snapshot.data!;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Card(
                child: ListTile(
                  title: Text(
                    category['name'],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showEditDialog(category),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteCategory(category['_id']),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => const CategoryAddPage(),
                  fullscreenDialog: true,
                ),
              )
              .then((_) =>
                  setState(() {})); // Cập nhật danh sách sau khi thêm mới
        },
        tooltip: 'Thêm mới',
        child: const Icon(Icons.add),
      ),
    );
  }
}
