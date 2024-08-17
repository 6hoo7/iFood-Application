// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../services/api_service.dart';
// import 'change_password.dart';

// class AccountPage extends StatefulWidget {
//   @override
//   _AccountPageState createState() => _AccountPageState();
// }

// class _AccountPageState extends State<AccountPage> {
//   final ApiService apiService = ApiService();
//   Map<String, dynamic>? userInfo;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserInfo();
//   }

//   Future<void> _loadUserInfo() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userId =
//         prefs.getString('userId'); // Lấy ID người dùng từ SharedPreferences

//     if (userId != null) {
//       try {
//         final user = await apiService.getUserInfo(userId);
//         setState(() {
//           userInfo = user;
//         });
//       } catch (e) {
//         print('Failed to load user info: $e');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (userInfo == null) {
//       return Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Tài khoản",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Theme.of(context).colorScheme.surface,
//         automaticallyImplyLeading: false, // Ngăn tự động thêm nút back
//         leading: SizedBox.shrink(), // Sử dụng SizedBox để không có icon
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: userInfo?['imagePath'] != null
//                         ? NetworkImage(userInfo!['imagePath'])
//                         : AssetImage('lib/images/default_avatar.jpg')
//                             as ImageProvider, // Sử dụng hình ảnh mặc định
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     userInfo?['username'] ?? 'Tên người dùng',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     userInfo?['email'] ?? 'email@example.com',
//                     style: TextStyle(fontSize: 16, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text('Cập nhật thông tin cá nhân'),
//               onTap: () {
//                 // Navigate to update personal info page
//               },
//             ),
//             Divider(
//               indent: 25,
//               endIndent: 25,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//             ListTile(
//               leading: Icon(Icons.lock),
//               title: Text('Thay đổi mật khẩu'),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const ChangePassword()));
//               },
//             ),
//             Divider(
//               indent: 25,
//               endIndent: 25,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//             ListTile(
//               leading: Icon(Icons.security),
//               title: Text('Xác thực hai yếu tố'),
//               onTap: () {
//                 // Navigate to two-factor authentication page
//               },
//             ),
//             Divider(
//               indent: 25,
//               endIndent: 25,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//             ListTile(
//               leading: Icon(Icons.local_offer),
//               title: Text('Ưu đãi của tôi'),
//               onTap: () {
//                 // Navigate to my offers page
//               },
//             ),
//             Divider(
//               indent: 25,
//               endIndent: 25,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//             ListTile(
//               leading: Icon(Icons.share),
//               title: Text('Giới thiệu bạn bè'),
//               onTap: () {
//                 // Navigate to refer a friend page
//               },
//             ),
//             Divider(
//               indent: 25,
//               endIndent: 25,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//             ListTile(
//               leading: Icon(Icons.help),
//               title: Text('Liên hệ hỗ trợ'),
//               onTap: () {
//                 // Navigate to support page
//               },
//             ),
//             Divider(
//               indent: 25,
//               endIndent: 25,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//             ListTile(
//               leading: Icon(Icons.info),
//               title: Text('Câu hỏi thường gặp'),
//               onTap: () {
//                 // Navigate to FAQ page
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';
import 'change_password.dart';
import '../pages/login_page.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final ApiService apiService = ApiService();
  Map<String, dynamic>? userInfo;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    if (userId != null) {
      try {
        final user = await apiService.getUserInfo(userId);
        setState(() {
          userInfo = user;
        });
      } catch (e) {
        print('Failed to load user info: $e');
      }
    }
  }

  Future<void> _deleteAccount() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    if (userId != null) {
      try {
        await apiService.deleteUser(userId);
        // Clear user ID from SharedPreferences
        await prefs.remove('userId');
        // Navigate to login page after account deletion
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } catch (e) {
        print('Failed to delete user account: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete user account')),
        );
      }
    }
  }

  void _confirmDeleteAccount() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Xác nhận xoá Tài khoản'),
        content: Text(
            'Tài khoản sẽ xoá vĩnh viễn khỏi hệ thống! Bạn có chắc chắn muốn xoá tài khoản này không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('HUỶ'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _deleteAccount();
            },
            child: Text(
              'XOÁ',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (userInfo == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tài khoản",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false,
        leading: SizedBox.shrink(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: userInfo?['imagePath'] != null
                        ? NetworkImage(userInfo!['imagePath'])
                        : AssetImage('lib/images/default_avatar.jpg')
                            as ImageProvider,
                  ),
                  SizedBox(height: 10),
                  Text(
                    userInfo?['username'] ?? 'Tên người dùng',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userInfo?['email'] ?? 'email@example.com',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Cập nhật thông tin cá nhân'),
              onTap: () {
                // Navigate to update personal info page
              },
            ),
            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Thay đổi mật khẩu'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangePassword()));
              },
            ),
            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Xác thực hai yếu tố'),
              onTap: () {
                // Navigate to two-factor authentication page
              },
            ),
            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('Ưu đãi của tôi'),
              onTap: () {
                // Navigate to my offers page
              },
            ),
            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Giới thiệu bạn bè'),
              onTap: () {
                // Navigate to refer a friend page
              },
            ),
            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Liên hệ hỗ trợ'),
              onTap: () {
                // Navigate to support page
              },
            ),
            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Câu hỏi thường gặp'),
              onTap: () {
                // Navigate to FAQ page
              },
            ),
            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Xóa tài khoản',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              onTap: _confirmDeleteAccount,
            ),
          ],
        ),
      ),
    );
  }
}
