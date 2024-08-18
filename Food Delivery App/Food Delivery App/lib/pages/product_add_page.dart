// // // // // import 'package:flutter/material.dart';

// // // // // class ProductAddPage extends StatefulWidget {
// // // // //   const ProductAddPage({super.key});

// // // // //   @override
// // // // //   State<ProductAddPage> createState() => _ProductAddPageState();
// // // // // }

// // // // // class _ProductAddPageState extends State<ProductAddPage> {
// // // // //   final TextEditingController _nameController = TextEditingController();
// // // // //   final TextEditingController _desController = TextEditingController();
// // // // //   final TextEditingController _priceController = TextEditingController();
// // // // //   final TextEditingController _imgController = TextEditingController();
// // // // //   final TextEditingController _catIdController = TextEditingController();

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: const Text(
// // // // //           "Thêm sản phẩm",
// // // // //           style: TextStyle(
// // // // //             fontSize: 20, // Tăng kích thước chữ
// // // // //             fontWeight: FontWeight.bold, // Làm chữ đậm
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //       body: SingleChildScrollView(
// // // // //         padding: const EdgeInsets.all(16.0),
// // // // //         child: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             const Text(
// // // // //               "Tên sản phẩm",
// // // // //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             TextField(
// // // // //               controller: _nameController,
// // // // //               decoration: const InputDecoration(
// // // // //                 hintText: "Nhập tên sản phẩm",
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 20),
// // // // //             const Text(
// // // // //               "Giá",
// // // // //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             TextField(
// // // // //               controller: _priceController,
// // // // //               keyboardType: TextInputType.number,
// // // // //               decoration: const InputDecoration(
// // // // //                 hintText: "Nhập giá sản phẩm",
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 20),
// // // // //             const Text(
// // // // //               "Đường dẫn hình ảnh",
// // // // //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             TextField(
// // // // //               controller: _imgController,
// // // // //               decoration: const InputDecoration(
// // // // //                 hintText: "Nhập đường dẫn hình ảnh",
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 20),
// // // // //             const Text(
// // // // //               "Mô tả",
// // // // //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             TextField(
// // // // //               controller: _desController,
// // // // //               maxLines: 5,
// // // // //               decoration: const InputDecoration(
// // // // //                 border: OutlineInputBorder(),
// // // // //                 hintText: 'Nhập mô tả sản phẩm',
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 20),
// // // // //             const Text(
// // // // //               "ID loại sản phẩm",
// // // // //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             TextField(
// // // // //               controller: _catIdController,
// // // // //               decoration: const InputDecoration(
// // // // //                 hintText: "Nhập ID loại sản phẩm",
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 40),
// // // // //             Center(
// // // // //               child: MyButton(
// // // // //                 text: "Lưu",
// // // // //                 onTap: () {
// // // // //                   // Thực hiện hành động lưu sản phẩm ở đây
// // // // //                   // Ví dụ: Gửi dữ liệu lên server hoặc thêm vào danh sách sản phẩm
// // // // //                 },
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class MyButton extends StatelessWidget {
// // // // //   final Function()? onTap;
// // // // //   final String text;
// // // // //   const MyButton({
// // // // //     super.key,
// // // // //     required this.text,
// // // // //     required this.onTap,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return GestureDetector(
// // // // //       onTap: onTap,
// // // // //       child: Container(
// // // // //         padding: const EdgeInsets.all(10),
// // // // //         margin: const EdgeInsets.symmetric(horizontal: 20),
// // // // //         decoration: BoxDecoration(
// // // // //           color: Theme.of(context).primaryColor,
// // // // //           borderRadius: BorderRadius.circular(50),
// // // // //         ),
// // // // //         child: Center(
// // // // //           child: Text(
// // // // //             text,
// // // // //             style: const TextStyle(
// // // // //               fontWeight: FontWeight.bold,
// // // // //               color: Colors.white,
// // // // //               fontSize: 16,
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:flutter/material.dart';

// // // // class ProductAddPage extends StatefulWidget {
// // // //   const ProductAddPage({super.key});

// // // //   @override
// // // //   State<ProductAddPage> createState() => _ProductAddPageState();
// // // // }

// // // // class _ProductAddPageState extends State<ProductAddPage> {
// // // //   final TextEditingController _nameController = TextEditingController();
// // // //   final TextEditingController _desController = TextEditingController();
// // // //   final TextEditingController _priceController = TextEditingController();
// // // //   final TextEditingController _imgController = TextEditingController();
// // // //   final TextEditingController _catIdController = TextEditingController();

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text(
// // // //           "Thêm sản phẩm",
// // // //           style: TextStyle(
// // // //             fontSize: 20, // Tăng kích thước chữ
// // // //             fontWeight: FontWeight.bold, // Làm chữ đậm
// // // //           ),
// // // //         ),
// // // //       ),
// // // //       body: SingleChildScrollView(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             const Text(
// // // //               "Tên sản phẩm",
// // // //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             TextField(
// // // //               controller: _nameController,
// // // //               decoration: const InputDecoration(
// // // //                 hintText: "Nhập tên sản phẩm",
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 20),
// // // //             const Text(
// // // //               "Mô tả",
// // // //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             TextField(
// // // //               controller: _desController,
// // // //               maxLines: 5,
// // // //               decoration: const InputDecoration(
// // // //                 border: OutlineInputBorder(),
// // // //                 hintText: 'Nhập mô tả sản phẩm',
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 20),
// // // //             const Text(
// // // //               "Đường dẫn hình ảnh",
// // // //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             TextField(
// // // //               controller: _imgController,
// // // //               decoration: const InputDecoration(
// // // //                 hintText: "Nhập đường dẫn hình ảnh",
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 20),
// // // //             const Text(
// // // //               "Giá",
// // // //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             TextField(
// // // //               controller: _priceController,
// // // //               keyboardType: TextInputType.number,
// // // //               decoration: const InputDecoration(
// // // //                 hintText: "Nhập giá sản phẩm",
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 20),
// // // //             const Text(
// // // //               "ID loại sản phẩm",
// // // //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             TextField(
// // // //               controller: _catIdController,
// // // //               decoration: const InputDecoration(
// // // //                 hintText: "Nhập ID loại sản phẩm",
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 40),
// // // //             Center(
// // // //               child: MyButton(
// // // //                 text: "Lưu",
// // // //                 onTap: () {
// // // //                   // Thực hiện hành động lưu sản phẩm ở đây
// // // //                   // Ví dụ: Gửi dữ liệu lên server hoặc thêm vào danh sách sản phẩm
// // // //                 },
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class MyButton extends StatelessWidget {
// // // //   final Function()? onTap;
// // // //   final String text;
// // // //   const MyButton({
// // // //     super.key,
// // // //     required this.text,
// // // //     required this.onTap,
// // // //   });

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return GestureDetector(
// // // //       onTap: onTap,
// // // //       child: Container(
// // // //         padding: const EdgeInsets.all(10),
// // // //         margin: const EdgeInsets.symmetric(horizontal: 20),
// // // //         decoration: BoxDecoration(
// // // //           color: Theme.of(context).primaryColor,
// // // //           borderRadius: BorderRadius.circular(50),
// // // //         ),
// // // //         child: Center(
// // // //           child: Text(
// // // //             text,
// // // //             style: const TextStyle(
// // // //               fontWeight: FontWeight.bold,
// // // //               color: Colors.white,
// // // //               fontSize: 16,
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // import 'package:flutter/material.dart';
// // import '../services/api_service.dart'; // Đảm bảo bạn đã import ApiService từ file thích hợp

// // class ProductAddPage extends StatefulWidget {
// //   const ProductAddPage({super.key});

// //   @override
// //   State<ProductAddPage> createState() => _ProductAddPageState();
// // }

// // class _ProductAddPageState extends State<ProductAddPage> {
// //   final TextEditingController _nameController = TextEditingController();
// //   final TextEditingController _desController = TextEditingController();
// //   final TextEditingController _priceController = TextEditingController();
// //   final TextEditingController _imgController = TextEditingController();
// //   final TextEditingController _catIdController = TextEditingController();

// //   final ApiService _apiService = ApiService();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           "Thêm sản phẩm",
// //           style: TextStyle(
// //             fontSize: 20, // Tăng kích thước chữ
// //             fontWeight: FontWeight.bold, // Làm chữ đậm
// //           ),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const Text(
// //               "Tên sản phẩm",
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             TextField(
// //               controller: _nameController,
// //               decoration: const InputDecoration(
// //                 hintText: "Nhập tên sản phẩm",
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             const Text(
// //               "Mô tả",
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             TextField(
// //               controller: _desController,
// //               maxLines: 5,
// //               decoration: const InputDecoration(
// //                 border: OutlineInputBorder(),
// //                 hintText: 'Nhập mô tả sản phẩm',
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             const Text(
// //               "Đường dẫn hình ảnh",
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             TextField(
// //               controller: _imgController,
// //               decoration: const InputDecoration(
// //                 hintText: "Nhập đường dẫn hình ảnh",
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             const Text(
// //               "Giá",
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             TextField(
// //               controller: _priceController,
// //               keyboardType: TextInputType.number,
// //               decoration: const InputDecoration(
// //                 hintText: "Nhập giá sản phẩm",
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             const Text(
// //               "ID loại sản phẩm",
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             TextField(
// //               controller: _catIdController,
// //               decoration: const InputDecoration(
// //                 hintText: "Nhập ID loại sản phẩm",
// //               ),
// //             ),
// //             const SizedBox(height: 40),
// //             Center(
// //               child: MyButton(
// //                 text: "Lưu",
// //                 onTap: () {
// //                   _addProduct();
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> _addProduct() async {
// //     final productData = {
// //       'name': _nameController.text,
// //       'description': _desController.text,
// //       'imagePath': _imgController.text,
// //       'price': double.parse(_priceController.text),
// //       'category': _catIdController.text,
// //     };

// //     try {
// //       final response = await _apiService.addProduct(productData);
// //       // Xử lý phản hồi từ server
// //       // Ví dụ: Hiển thị thông báo thành công hoặc chuyển hướng
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Sản phẩm đã được thêm thành công!')),
// //       );
// //     } catch (error) {
// //       // Xử lý lỗi
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Lỗi: $error')),
// //       );
// //     }
// //   }
// // }

// // class MyButton extends StatelessWidget {
// //   final Function()? onTap;
// //   final String text;
// //   const MyButton({
// //     super.key,
// //     required this.text,
// //     required this.onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         padding: const EdgeInsets.all(10),
// //         margin: const EdgeInsets.symmetric(horizontal: 20),
// //         decoration: BoxDecoration(
// //           color: Theme.of(context).primaryColor,
// //           borderRadius: BorderRadius.circular(50),
// //         ),
// //         child: Center(
// //           child: Text(
// //             text,
// //             style: const TextStyle(
// //               fontWeight: FontWeight.bold,
// //               color: Colors.white,
// //               fontSize: 16,
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import '../services/api_service.dart'; // Đảm bảo bạn đã import ApiService từ file thích hợp

// class ProductAddPage extends StatefulWidget {
//   const ProductAddPage({super.key});

//   @override
//   State<ProductAddPage> createState() => _ProductAddPageState();
// }

// class _ProductAddPageState extends State<ProductAddPage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _desController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   final TextEditingController _imgController = TextEditingController();

//   final ApiService _apiService = ApiService();
//   List<Map<String, dynamic>> _categories = [];
//   String? _selectedCategory;

//   @override
//   void initState() {
//     super.initState();
//     _fetchCategories();
//   }

//   Future<void> _fetchCategories() async {
//     try {
//       final categories = await _apiService.getAllCategories();
//       setState(() {
//         _categories = categories.cast<Map<String, dynamic>>();
//         if (_categories.isNotEmpty) {
//           _selectedCategory = _categories[0]['name'] as String;
//         }
//       });
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Lỗi khi lấy danh mục: $error')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Thêm sản phẩm",
//           style: TextStyle(
//             fontSize: 20, // Tăng kích thước chữ
//             fontWeight: FontWeight.bold, // Làm chữ đậm
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Tên sản phẩm",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(
//                 hintText: "Nhập tên sản phẩm",
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Mô tả",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               controller: _desController,
//               maxLines: 5,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Nhập mô tả sản phẩm',
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Đường dẫn hình ảnh",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               controller: _imgController,
//               decoration: const InputDecoration(
//                 hintText: "Nhập đường dẫn hình ảnh",
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Giá",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               controller: _priceController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 hintText: "Nhập giá sản phẩm",
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Loại sản phẩm",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 5.0),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(4.0),
//                     ),
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButton<String>(
//                         isExpanded: true,
//                         value: _selectedCategory,
//                         hint: const Text('Chọn loại sản phẩm'),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             _selectedCategory = newValue;
//                           });
//                         },
//                         items: _categories
//                             .map<DropdownMenuItem<String>>((category) {
//                           return DropdownMenuItem<String>(
//                             value: category['name'] as String,
//                             child: Text(category['name'] as String),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 40),
//             Center(
//               child: MyButton(
//                 text: "Lưu",
//                 onTap: () {
//                   _addProduct();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _addProduct() async {
//     final productData = {
//       'name': _nameController.text,
//       'description': _desController.text,
//       'imagePath': _imgController.text,
//       'price': double.parse(_priceController.text),
//       'category': _selectedCategory ?? '', // Sử dụng giá trị đã chọn
//     };

//     try {
//       final response = await _apiService.addProduct(productData);
//       // Xử lý phản hồi từ server
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Sản phẩm đã được thêm thành công!')),
//       );
//     } catch (error) {
//       // Xử lý lỗi
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Lỗi: $error')),
//       );
//     }
//   }
// }

// class MyButton extends StatelessWidget {
//   final Function()? onTap;
//   final String text;
//   const MyButton({
//     super.key,
//     required this.text,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         margin: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           color: Theme.of(context).primaryColor,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../services/api_service.dart'; // Đảm bảo bạn đã import ApiService từ file thích hợp

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();

  final ApiService _apiService = ApiService();
  List<Map<String, dynamic>> _categories = [];
  String? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      final categories = await _apiService.getAllCategories();
      print('Categories received: $categories'); // In ra dữ liệu để kiểm tra
      setState(() {
        _categories = categories.cast<Map<String, dynamic>>();
        if (_categories.isNotEmpty) {
          _selectedCategoryId = _categories[0]['_id'] as String?;
        }
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi khi lấy danh mục: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thêm sản phẩm",
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
              "Tên sản phẩm",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: "Nhập tên sản phẩm",
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
                hintText: 'Nhập mô tả sản phẩm',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Đường dẫn hình ảnh",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _imgController,
              decoration: const InputDecoration(
                hintText: "Nhập đường dẫn hình ảnh",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Giá",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Nhập giá sản phẩm",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Loại sản phẩm",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedCategoryId,
                        hint: const Text('Chọn loại sản phẩm'),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCategoryId = newValue;
                          });
                        },
                        items: _categories
                            .where((category) =>
                                category['_id'] != null &&
                                category['name'] != null)
                            .map<DropdownMenuItem<String>>((category) {
                          final categoryId = category['_id'] as String?;
                          final categoryName = category['name'] as String?;
                          return DropdownMenuItem<String>(
                            value: categoryId,
                            child: Text(categoryName ?? 'Không tên'),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: MyButton(
                text: "Lưu",
                onTap: () {
                  _addProduct();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addProduct() async {
    if (_selectedCategoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn loại sản phẩm')),
      );
      return;
    }

    final productData = {
      'name': _nameController.text,
      'description': _desController.text,
      'imagePath': _imgController.text,
      'price': double.parse(_priceController.text),
      'category': _selectedCategoryId!,
    };

    try {
      final response = await _apiService.addProduct(productData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sản phẩm đã được thêm thành công!')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: $error')),
      );
    }
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
