// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/services/api_service.dart';
// import 'package:food_delivery_app/pages/product_add_page.dart';

// class ProductManagementPage extends StatefulWidget {
//   const ProductManagementPage({super.key});

//   @override
//   State<ProductManagementPage> createState() => _ProductManagementPageState();
// }

// class _ProductManagementPageState extends State<ProductManagementPage> {
//   final ApiService apiService = ApiService();
//   late Future<List<dynamic>> _products = apiService.getProducts();

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _deleteProduct(String productId) async {
//     try {
//       await apiService.deleteProduct(productId);
//       setState(() {
//         _products = apiService.getProducts();
//       });
//     } catch (error) {
//       // Không thông báo lỗi khi xoá không thành công
//     }
//   }

//   void _showDeleteConfirmationDialog(String productId) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Xác nhận xóa'),
//           content: const Text('Bạn có chắc chắn muốn xóa sản phẩm này?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Hủy'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _deleteProduct(productId);
//               },
//               child: const Text('Xóa'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showEditDialog(dynamic product) {
//     final TextEditingController nameController =
//         TextEditingController(text: product['name']);
//     final TextEditingController descriptionController =
//         TextEditingController(text: product['description']);
//     final TextEditingController imagePathController =
//         TextEditingController(text: product['imagePath']);
//     final TextEditingController priceController =
//         TextEditingController(text: product['price'].toString());
//     final TextEditingController categoryController =
//         TextEditingController(text: product['category']);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Chỉnh sửa sản phẩm'),
//           content: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('Tên sản phẩm'),
//                 TextField(
//                   controller: nameController,
//                   decoration:
//                       const InputDecoration(hintText: "Nhập tên sản phẩm"),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text('Mô tả'),
//                 TextField(
//                   controller: descriptionController,
//                   maxLines: 3,
//                   decoration:
//                       const InputDecoration(hintText: "Nhập mô tả sản phẩm"),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text('Đường dẫn hình ảnh'),
//                 TextField(
//                   controller: imagePathController,
//                   decoration: const InputDecoration(
//                       hintText: "Nhập đường dẫn hình ảnh"),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text('Giá'),
//                 TextField(
//                   controller: priceController,
//                   keyboardType: TextInputType.number,
//                   decoration:
//                       const InputDecoration(hintText: "Nhập giá sản phẩm"),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text('ID loại sản phẩm'),
//                 TextField(
//                   controller: categoryController,
//                   decoration:
//                       const InputDecoration(hintText: "Nhập ID loại sản phẩm"),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Hủy'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 final updatedProduct = {
//                   'name': nameController.text,
//                   'description': descriptionController.text,
//                   'imagePath': imagePathController.text,
//                   'price': double.parse(priceController.text),
//                   'category': categoryController.text,
//                 };

//                 try {
//                   await apiService.updateProduct(
//                       product['_id'], updatedProduct);
//                   setState(() {
//                     _products = apiService.getProducts();
//                   });
//                   Navigator.of(context).pop();
//                 } catch (error) {
//                   // Không thông báo lỗi khi cập nhật không thành công
//                 }
//               },
//               child: const Text('Lưu'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Quản lý sản phẩm",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: FutureBuilder<List<dynamic>>(
//         future: _products,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Lỗi: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('Không có sản phẩm nào'));
//           }

//           final products = snapshot.data!;
//           return ListView.builder(
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               return Card(
//                 child: ListTile(
//                   leading: product['imagePath'] != null &&
//                           product['imagePath'].isNotEmpty
//                       ? Image.network(product['imagePath'],
//                           width: 50, height: 50, fit: BoxFit.cover)
//                       : const Icon(Icons.image_not_supported),
//                   title: Text(product['name']),
//                   subtitle: Text(
//                     '${product['price']} VND',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.edit),
//                         onPressed: () => _showEditDialog(product),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.delete),
//                         onPressed: () =>
//                             _showDeleteConfirmationDialog(product['_id']),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context)
//               .push(
//             MaterialPageRoute(
//               builder: (_) => const ProductAddPage(),
//               fullscreenDialog: true,
//             ),
//           )
//               .then((_) {
//             setState(() {
//               _products = apiService.getProducts();
//             });
//           });
//         },
//         tooltip: 'Thêm mới',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/api_service.dart';
import 'package:food_delivery_app/pages/product_add_page.dart';

class ProductManagementPage extends StatefulWidget {
  const ProductManagementPage({super.key});

  @override
  State<ProductManagementPage> createState() => _ProductManagementPageState();
}

class _ProductManagementPageState extends State<ProductManagementPage> {
  final ApiService apiService = ApiService();
  late Future<List<dynamic>> _products = apiService.getProducts();
  late Future<List<dynamic>> _categories =
      apiService.getAllCategories(); // Fetch categories

  @override
  void initState() {
    super.initState();
  }

  void _deleteProduct(String productId) async {
    try {
      await apiService.deleteProduct(productId);
      setState(() {
        _products = apiService.getProducts();
      });
    } catch (error) {
      // Không thông báo lỗi khi xoá không thành công
    }
  }

  void _showDeleteConfirmationDialog(String productId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa'),
          content: const Text('Bạn có chắc chắn muốn xóa sản phẩm này?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteProduct(productId);
              },
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(dynamic product) async {
    final TextEditingController nameController =
        TextEditingController(text: product['name']);
    final TextEditingController descriptionController =
        TextEditingController(text: product['description']);
    final TextEditingController imagePathController =
        TextEditingController(text: product['imagePath']);
    final TextEditingController priceController =
        TextEditingController(text: product['price'].toString());
    String? selectedCategoryId = product['category'];

    // Get categories
    List<dynamic> categories = await _categories;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Chỉnh sửa sản phẩm'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tên sản phẩm'),
                    TextField(
                      controller: nameController,
                      decoration:
                          const InputDecoration(hintText: "Nhập tên sản phẩm"),
                    ),
                    const SizedBox(height: 10),
                    const Text('Mô tả'),
                    TextField(
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                          hintText: "Nhập mô tả sản phẩm"),
                    ),
                    const SizedBox(height: 10),
                    const Text('Đường dẫn hình ảnh'),
                    TextField(
                      controller: imagePathController,
                      decoration: const InputDecoration(
                          hintText: "Nhập đường dẫn hình ảnh"),
                    ),
                    const SizedBox(height: 10),
                    const Text('Giá'),
                    TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: "Nhập giá sản phẩm"),
                    ),
                    const SizedBox(height: 10),
                    const Text('Loại sản phẩm'),
                    DropdownButton<String>(
                      value: selectedCategoryId,
                      isExpanded: true,
                      hint: const Text('Chọn loại sản phẩm'),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategoryId = newValue;
                        });
                      },
                      items:
                          categories.map<DropdownMenuItem<String>>((category) {
                        return DropdownMenuItem<String>(
                          value: category['_id'] as String,
                          child: Text(category['name'] as String),
                        );
                      }).toList(),
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
                    final updatedProduct = {
                      'name': nameController.text,
                      'description': descriptionController.text,
                      'imagePath': imagePathController.text,
                      'price': double.parse(priceController.text),
                      'category': selectedCategoryId ?? '', // Use category id
                    };

                    try {
                      await apiService.updateProduct(
                          product['_id'], updatedProduct);
                      setState(() {
                        _products = apiService.getProducts();
                      });
                      Navigator.of(context).pop();
                    } catch (error) {
                      // Không thông báo lỗi khi cập nhật không thành công
                    }
                  },
                  child: const Text('Lưu'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quản lý sản phẩm",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Không có sản phẩm nào'));
          }

          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                child: ListTile(
                  leading: product['imagePath'] != null &&
                          product['imagePath'].isNotEmpty
                      ? Image.network(product['imagePath'],
                          width: 50, height: 50, fit: BoxFit.cover)
                      : const Icon(Icons.image_not_supported),
                  title: Text(product['name']),
                  subtitle: Text(
                    '${product['price']} VND',
                    style: TextStyle(color: Colors.red),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showEditDialog(product),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () =>
                            _showDeleteConfirmationDialog(product['_id']),
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
              builder: (_) => const ProductAddPage(),
              fullscreenDialog: true,
            ),
          )
              .then((_) {
            setState(() {
              _products = apiService.getProducts();
            });
          });
        },
        tooltip: 'Thêm mới',
        child: const Icon(Icons.add),
      ),
    );
  }
}
