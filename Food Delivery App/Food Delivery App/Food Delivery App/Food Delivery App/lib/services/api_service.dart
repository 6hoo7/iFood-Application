import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // final String baseUrl = 'http://192.168.100.150:8080/api';
  final String baseUrl = 'http://10.21.37.200:8080/api';

  Future<dynamic> signup(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to sign up: ${response.body}');
    }
  }

  Future<dynamic> signin(String phoneNum, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phoneNum': phoneNum,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      await _saveUserId(responseData['user']['_id']); // Lưu ID người dùng
      return responseData;
    } else {
      throw Exception('Failed to sign in: ${response.body}');
    }
  }

  Future<void> _saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  Future<dynamic> getUserInfo(String userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get user info: ${response.body}');
    }
  }

  Future<dynamic> addProduct(Map<String, dynamic> productData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(productData),
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to add product: ${response.body}');
    }
  }

  Future<List<dynamic>> getProducts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> deleteProduct(String productId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/products/$productId'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete product: ${response.body}');
    }
  }

  Future<void> updateProduct(
      String productId, Map<String, dynamic> updatedProduct) async {
    final response = await http.put(
      Uri.parse('$baseUrl/products/$productId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedProduct),
    );

    if (response.statusCode != 200) {
      throw Exception('Không thể cập nhật sản phẩm');
    }
  }

  Future<List<dynamic>> getAllCategories() async {
    final response = await http.get(
      Uri.parse('$baseUrl/categories'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data;
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<dynamic> getCategoryById(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/categories/$id'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load category');
    }
  }

  Future<void> createCategory(String name, String description) async {
    final url = Uri.parse('$baseUrl/categories'); // Thay thế đường dẫn API

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': name,
        'description': description,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create category');
    }
  }

  Future<void> updateCategory(
      String id, Map<String, dynamic> categoryData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/categories/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(categoryData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update category');
    }
  }

  Future<void> deleteCategory(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/categories/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete category');
    }
  }

  Future<void> changePassword(String userId, String oldPassword,
      String newPassword, String confirmPassword) async {
    final response = await http.put(
      Uri.parse('$baseUrl/changepassword/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'oldPassword': oldPassword,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to change password: ${response.body}');
    }
  }

  Future<void> deleteUser(String userId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/deleteUser/$userId'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user: ${response.body}');
    }
  }
}
