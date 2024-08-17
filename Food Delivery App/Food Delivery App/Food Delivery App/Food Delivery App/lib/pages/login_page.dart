// // import 'package:flutter/material.dart';
// // import 'package:food_delivery_app/components/my_button.dart';
// // import 'package:food_delivery_app/components/my_textfield.dart';
// // import 'package:food_delivery_app/components/square_tile.dart';
// // import 'package:food_delivery_app/pages/Admin_page.dart';
// // import 'home_page.dart';

// // class LoginPage extends StatefulWidget {
// //   final void Function()? onTap;

// //   const LoginPage({super.key, required this.onTap});

// //   @override
// //   State<LoginPage> createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   // Text editing controllers
// //   final TextEditingController phonenumberController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();

// //   // Login Method
// //   void login() {
// //     // Lấy giá trị từ các text controller
// //     String phoneNumber = phonenumberController.text.trim();
// //     String password = passwordController.text.trim();

// //     // Thực hiện xác thực ở đây, ví dụ:
// //     if (phoneNumber == '123456' && password == '12345') {
// //       // Chuyển hướng đến trang AdminPage
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(builder: (context) => const AdminPage()),
// //       );
// //     } else {
// //       // Nếu không đúng, chuyển hướng đến trang HomePage
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(builder: (context) => const HomePage()),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: SingleChildScrollView(
// //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               // logo
// //               const Padding(
// //                 padding: EdgeInsets.only(top: 5.0),
// //                 child: Image(
// //                   image: AssetImage('lib/images/logo.png'),
// //                   width: 200,
// //                   height: 200,
// //                 ),
// //               ),
// //               const SizedBox(height: 10),
// //               // message, app slogan
// //               Text(
// //                 "Food Delivery App",
// //                 style: TextStyle(
// //                   fontSize: 16,
// //                   color: Theme.of(context).colorScheme.inversePrimary,
// //                 ),
// //               ),
// //               const SizedBox(height: 25),
// //               // phone number textfield
// //               MyTextField(
// //                 controller: phonenumberController,
// //                 hintText: "Số điện thoại",
// //                 obscureText: false,
// //               ),
// //               const SizedBox(height: 10),
// //               // password textfield
// //               MyTextField(
// //                 controller: passwordController,
// //                 hintText: "Mật khẩu",
// //                 obscureText: true,
// //               ),
// //               const SizedBox(height: 10),
// //               // sign in button
// //               MyButton(
// //                 text: "Đăng nhập",
// //                 onTap: login,
// //               ),
// //               const SizedBox(height: 10),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //                 child: Text(
// //                   "Hoặc đăng nhập với",
// //                   style: TextStyle(
// //                     color: Theme.of(context).colorScheme.inversePrimary,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 10),
// //               const Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   // google button
// //                   SquareTile(imagePath: 'lib/images/google.png'),
// //                   SizedBox(width: 20),
// //                   // facebook button
// //                   SquareTile(imagePath: 'lib/images/facebook.png'),
// //                 ],
// //               ),
// //               const SizedBox(height: 10),
// //               // not a member? register now
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text(
// //                     "Bạn chưa có tài khoản?",
// //                     style: TextStyle(
// //                       color: Theme.of(context).colorScheme.inversePrimary,
// //                     ),
// //                   ),
// //                   const SizedBox(width: 4),
// //                   GestureDetector(
// //                     onTap: widget.onTap,
// //                     child: Text(
// //                       "Đăng ký ngay.",
// //                       style: TextStyle(
// //                         color: Theme.of(context).colorScheme.inversePrimary,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:food_delivery_app/components/my_button.dart';
// // import 'package:food_delivery_app/components/my_textfield.dart';
// // import 'package:food_delivery_app/components/square_tile.dart';
// // import 'package:food_delivery_app/pages/Admin_page.dart';
// // import 'package:food_delivery_app/pages/home_page.dart';
// // import 'package:food_delivery_app/services/api_service.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class LoginPage extends StatefulWidget {
// //   final void Function()? onTap;

// //   const LoginPage({super.key, required this.onTap});

// //   @override
// //   State<LoginPage> createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   // Text editing controllers
// //   final TextEditingController phonenumberController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final ApiService apiService = ApiService();

// //   // Login Method
// //   void login() async {
// //     // Lấy giá trị từ các text controller
// //     String phoneNumber = phonenumberController.text.trim();
// //     String password = passwordController.text.trim();

// //     try {
// //       // Gọi API đăng nhập
// //       final response = await apiService.signin(phoneNumber, password);

// //       // Lưu trữ token
// //       SharedPreferences prefs = await SharedPreferences.getInstance();
// //       await prefs.setString('token', response['token']);

// //       // Chuyển hướng dựa trên phản hồi từ server
// //       if (phoneNumber == '123456' && password == '12345') {
// //         // Chuyển hướng đến trang AdminPage
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (context) => const AdminPage()),
// //         );
// //       } else {
// //         // Nếu không đúng, chuyển hướng đến trang HomePage
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (context) => const HomePage()),
// //         );
// //       }
// //     } catch (e) {
// //       // Xử lý lỗi
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Login failed: $e')),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: SingleChildScrollView(
// //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               // logo
// //               const Padding(
// //                 padding: EdgeInsets.only(top: 5.0),
// //                 child: Image(
// //                   image: AssetImage('lib/images/logo.png'),
// //                   width: 200,
// //                   height: 200,
// //                 ),
// //               ),
// //               const SizedBox(height: 10),
// //               // message, app slogan
// //               Text(
// //                 "Food Delivery App",
// //                 style: TextStyle(
// //                   fontSize: 16,
// //                   color: Theme.of(context).colorScheme.inversePrimary,
// //                 ),
// //               ),
// //               const SizedBox(height: 25),
// //               // phone number textfield
// //               MyTextField(
// //                 controller: phonenumberController,
// //                 hintText: "Số điện thoại",
// //                 obscureText: false,
// //               ),
// //               const SizedBox(height: 10),
// //               // password textfield
// //               MyTextField(
// //                 controller: passwordController,
// //                 hintText: "Mật khẩu",
// //                 obscureText: true,
// //               ),
// //               const SizedBox(height: 10),
// //               // sign in button
// //               MyButton(
// //                 text: "Đăng nhập",
// //                 onTap: login,
// //               ),
// //               const SizedBox(height: 10),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //                 child: Text(
// //                   "Hoặc đăng nhập với",
// //                   style: TextStyle(
// //                     color: Theme.of(context).colorScheme.inversePrimary,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 10),
// //               const Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   // google button
// //                   SquareTile(imagePath: 'lib/images/google.png'),
// //                   SizedBox(width: 20),
// //                   // facebook button
// //                   SquareTile(imagePath: 'lib/images/facebook.png'),
// //                 ],
// //               ),
// //               const SizedBox(height: 10),
// //               // not a member? register now
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text(
// //                     "Bạn chưa có tài khoản?",
// //                     style: TextStyle(
// //                       color: Theme.of(context).colorScheme.inversePrimary,
// //                     ),
// //                   ),
// //                   const SizedBox(width: 4),
// //                   GestureDetector(
// //                     onTap: widget.onTap,
// //                     child: Text(
// //                       "Đăng ký ngay.",
// //                       style: TextStyle(
// //                         color: Theme.of(context).colorScheme.inversePrimary,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/components/my_button.dart';
// import 'package:food_delivery_app/components/my_textfield.dart';
// import 'package:food_delivery_app/components/square_tile.dart';
// import 'package:food_delivery_app/pages/Admin_page.dart';
// import 'package:food_delivery_app/pages/home_page.dart';
// import 'package:food_delivery_app/pages/register_page.dart';
// import 'package:food_delivery_app/services/api_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   final void Function()? onTap;

//   const LoginPage({super.key, this.onTap});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   // Text editing controllers
//   final TextEditingController phonenumberController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final ApiService apiService = ApiService();

//   // Login Method
//   void login() async {
//     // Lấy giá trị từ các text controller
//     String phoneNumber = phonenumberController.text.trim();
//     String password = passwordController.text.trim();

//     try {
//       // Gọi API đăng nhập
//       final response = await apiService.signin(phoneNumber, password);

//       // Lưu trữ token
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('token', response['token']);

//       // Chuyển hướng dựa trên phản hồi từ server
//       if (phoneNumber == '123456' && password == '12345') {
//         // Chuyển hướng đến trang AdminPage
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const AdminPage()),
//         );
//       } else {
//         // Nếu không đúng, chuyển hướng đến trang HomePage
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const HomePage()),
//         );
//       }
//     } catch (e) {
//       // Xử lý lỗi
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Login failed: $e')),
//       );
//     }
//   }

//   void _navigateToRegisterPage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => RegisterPage(onTap: () {
//                 Navigator.pop(context);
//               })),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // logo
//               const Padding(
//                 padding: EdgeInsets.only(top: 5.0),
//                 child: Image(
//                   image: AssetImage('lib/images/logo.png'),
//                   width: 200,
//                   height: 200,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               // message, app slogan
//               Text(
//                 "Food Delivery App",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Theme.of(context).colorScheme.inversePrimary,
//                 ),
//               ),
//               const SizedBox(height: 25),
//               // phone number textfield
//               MyTextField(
//                 controller: phonenumberController,
//                 hintText: "Số điện thoại",
//                 obscureText: false,
//               ),
//               const SizedBox(height: 10),
//               // password textfield
//               MyTextField(
//                 controller: passwordController,
//                 hintText: "Mật khẩu",
//                 obscureText: true,
//               ),
//               const SizedBox(height: 10),
//               // sign in button
//               MyButton(
//                 text: "Đăng nhập",
//                 onTap: login,
//               ),
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Text(
//                   "Hoặc đăng nhập với",
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.inversePrimary,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // google button
//                   SquareTile(imagePath: 'lib/images/google.png'),
//                   SizedBox(width: 20),
//                   // facebook button
//                   SquareTile(imagePath: 'lib/images/facebook.png'),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               // not a member? register now
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Bạn chưa có tài khoản?",
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.inversePrimary,
//                     ),
//                   ),
//                   const SizedBox(width: 4),
//                   GestureDetector(
//                     onTap: _navigateToRegisterPage,
//                     child: Text(
//                       "Đăng ký ngay.",
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.inversePrimary,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/components/square_tile.dart';
import 'package:food_delivery_app/pages/Admin_page.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/register_page.dart';
import 'package:food_delivery_app/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService();

  // Login Method
  void login() async {
    // Lấy giá trị từ các text controller
    String phoneNumber = phonenumberController.text.trim();
    String password = passwordController.text.trim();

    try {
      // Gọi API đăng nhập
      final response = await apiService.signin(phoneNumber, password);

      // Lưu trữ token
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response['token']);

      // Chuyển hướng dựa trên phản hồi từ server
      if (phoneNumber == '123456' && password == '12345') {
        // Chuyển hướng đến trang AdminPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AdminPage()),
        );
      } else {
        // Nếu không đúng, chuyển hướng đến trang HomePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } catch (e) {
      // Xử lý lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e')),
      );
    }
  }

  void _navigateToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RegisterPage(onTap: () {
                Navigator.pop(context);
              })),
    );
  }

  void _navigateToAdminPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdminPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Image(
                  image: AssetImage('lib/images/logo.png'),
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 10),
              // message, app slogan
              Text(
                "Food Delivery App",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 10),
              // admin icon
              GestureDetector(
                onTap: _navigateToAdminPage,
                child: const Icon(
                  Icons.admin_panel_settings,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 25),
              // phone number textfield
              MyTextField(
                controller: phonenumberController,
                hintText: "Số điện thoại",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: "Mật khẩu",
                obscureText: true,
              ),
              const SizedBox(height: 10),
              // sign in button
              MyButton(
                text: "Đăng nhập",
                onTap: login,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Hoặc đăng nhập với",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTile(imagePath: 'lib/images/google.png'),
                  SizedBox(width: 20),
                  // facebook button
                  SquareTile(imagePath: 'lib/images/facebook.png'),
                ],
              ),
              const SizedBox(height: 10),
              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bạn chưa có tài khoản?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: _navigateToRegisterPage,
                    child: Text(
                      "Đăng ký ngay.",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
