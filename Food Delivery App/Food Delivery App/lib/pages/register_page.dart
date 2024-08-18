// // // import 'dart:convert';
// // // import 'package:flutter/material.dart';
// // // import 'package:food_delivery_app/pages/login_page.dart';
// // // import '../components/my_button.dart';
// // // import '../components/my_textfield.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'package:food_delivery_app/conf/config.dart';

// // // class RegisterPage extends StatefulWidget {
// // //   final void Function()? onTap;

// // //   const RegisterPage({
// // //     super.key,
// // //     required this.onTap,
// // //   });

// // //   @override
// // //   State<RegisterPage> createState() => _RegisterPageState();
// // // }

// // // class _RegisterPageState extends State<RegisterPage> {
// // //   // Text editing controllers
// // //   final TextEditingController usernameController = TextEditingController();
// // //   final TextEditingController phoneNumController = TextEditingController();
// // //   final TextEditingController emailController = TextEditingController();
// // //   final TextEditingController passwordController = TextEditingController();
// // //   final TextEditingController confirmPasswordController = TextEditingController();

// // //   void registerUser() async {
// // //     if (usernameController.text.isNotEmpty && phoneNumController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty) {
// // //       var regBody = {
// // //         "username": usernameController.text,
// // //         "phoneNum": phoneNumController.text,
// // //         "email": emailController.text,
// // //         "password": passwordController.text,
// // //         "confirmPassword": confirmPasswordController.text
// // //       };
// // //       var response = await http.post(Uri.parse(signup),
// // //           headers: {"Content-Type": "application/json"},
// // //           body: jsonEncode(regBody));
// // //       var jsonResponse = jsonDecode(response.body);
// // //       print(jsonResponse['status']);
// // //       if (jsonResponse['status']) {
// // //         Navigator.push(
// // //             context,
// // //         MaterialPageRoute(builder: (context) => const LoginPage()));
// // //       } else {
// // //         print("Đăng ký thất bại!");
// // //       }
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Center(
// // //         child: SingleChildScrollView(
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               // logo
// // //               const Padding(
// // //                 padding: EdgeInsets.only(top: 5.0),
// // //                 child: Image(
// // //                   image: AssetImage('lib/images/logo.png'),
// // //                   width: 200,
// // //                   height: 200,
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 10),
// // //               // message, app slogan
// // //               Text(
// // //                 "Hãy tạo một tài khoản cho bạn",
// // //                 style: TextStyle(
// // //                   fontSize: 16,
// // //                   color: Theme.of(context).colorScheme.inversePrimary,
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 25),
// // //               // username textfield
// // //               MyTextField(
// // //                 controller: usernameController,
// // //                 hintText: "Tên đăng nhập",
// // //                 obscureText: false,
// // //               ),
// // //               const SizedBox(height: 10),
// // //               // phone number textfield
// // //               MyTextField(
// // //                 controller: phoneNumController,
// // //                 hintText: "Số điện thoại",
// // //                 obscureText: false,
// // //               ),
// // //               const SizedBox(height: 10),
// // //               // email textfield
// // //               MyTextField(
// // //                 controller: emailController,
// // //                 hintText: "Email",
// // //                 obscureText: false,
// // //               ),
// // //               const SizedBox(height: 10),
// // //               // password textfield
// // //               MyTextField(
// // //                 controller: passwordController,
// // //                 hintText: "Mật khẩu",
// // //                 obscureText: true,
// // //               ),
// // //               const SizedBox(height: 10),
// // //               // confirm password textfield
// // //               MyTextField(
// // //                 controller: confirmPasswordController,
// // //                 hintText: "Xác nhận mật khẩu",
// // //                 obscureText: true,
// // //               ),
// // //               const SizedBox(height: 10),
// // //               // sign up button
// // //               MyButton(
// // //                 text: "Đăng ký",
// // //                 onTap: ()=>{registerUser()},
// // //               ),
// // //               const SizedBox(height: 10),
// // //               // already have an account? Login here
// // //               Row(
// // //                 mainAxisAlignment: MainAxisAlignment.center,
// // //                 children: [
// // //                   Text(
// // //                     "Bạn có sẵn sàng để tạo một tài khoản?",
// // //                     style: TextStyle(
// // //                       color: Theme.of(context).colorScheme.inversePrimary,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(width: 4),
// // //                   GestureDetector(
// // //                     onTap: widget.onTap,
// // //                     child: Text(
// // //                       "Đăng nhập ngay.",
// // //                       style: TextStyle(
// // //                         color: Theme.of(context).colorScheme.inversePrimary,
// // //                         fontWeight: FontWeight.bold,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import '../components/my_button.dart';
// // import '../components/my_textfield.dart';
// // import '../services/api_service.dart';

// // class RegisterPage extends StatefulWidget {
// //   final void Function()? onTap;

// //   const RegisterPage({
// //     super.key,
// //     required this.onTap,
// //   });

// //   @override
// //   State<RegisterPage> createState() => _RegisterPageState();
// // }

// // class _RegisterPageState extends State<RegisterPage> {
// //   // Text editing controllers
// //   final TextEditingController usernameController = TextEditingController();
// //   final TextEditingController phonenumberController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController confirmPasswordController =
// //       TextEditingController();

// //   final ApiService apiService = ApiService();

// //   void _signup() async {
// //     if (passwordController.text != confirmPasswordController.text) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Passwords do not match')),
// //       );
// //       return;
// //     }

// //     try {
// //       final response = await apiService.signup({
// //         'username': usernameController.text,
// //         'phoneNum': phonenumberController.text,
// //         'email': emailController.text,
// //         'password': passwordController.text,
// //         'confirmPassword': confirmPasswordController.text,
// //       });
// //       // Xử lý phản hồi thành công
// //       print('Signup success: $response');
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Signup successful!')),
// //       );
// //     } catch (e) {
// //       // Xử lý lỗi
// //       print('Signup failed: $e');
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Signup failed: $e')),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: SingleChildScrollView(
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
// //                 "Hãy tạo một tài khoản cho bạn",
// //                 style: TextStyle(
// //                   fontSize: 16,
// //                   color: Theme.of(context).colorScheme.inversePrimary,
// //                 ),
// //               ),
// //               const SizedBox(height: 25),
// //               // username textfield
// //               MyTextField(
// //                 controller: usernameController,
// //                 hintText: "Tên đăng nhập",
// //                 obscureText: false,
// //               ),
// //               const SizedBox(height: 10),
// //               // phone number textfield
// //               MyTextField(
// //                 controller: phonenumberController,
// //                 hintText: "Số điện thoại",
// //                 obscureText: false,
// //               ),
// //               const SizedBox(height: 10),
// //               // email textfield
// //               MyTextField(
// //                 controller: emailController,
// //                 hintText: "Email",
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
// //               // confirm password textfield
// //               MyTextField(
// //                 controller: confirmPasswordController,
// //                 hintText: "Xác nhận mật khẩu",
// //                 obscureText: true,
// //               ),
// //               const SizedBox(height: 10),
// //               // sign up button
// //               MyButton(
// //                 text: "Đăng ký",
// //                 onTap: _signup,
// //               ),
// //               const SizedBox(height: 10),
// //               // already have an account? Login here
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text(
// //                     "Bạn có sẵn sàng để tạo một tài khoản?",
// //                     style: TextStyle(
// //                       color: Theme.of(context).colorScheme.inversePrimary,
// //                     ),
// //                   ),
// //                   const SizedBox(width: 4),
// //                   GestureDetector(
// //                     onTap: widget.onTap,
// //                     child: Text(
// //                       "Đăng nhập ngay.",
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
// import '../components/my_button.dart';
// import '../components/my_textfield.dart';
// import '../services/api_service.dart';
// import 'login_page.dart'; // Import trang đăng nhập

// class RegisterPage extends StatefulWidget {
//   final void Function()? onTap;

//   const RegisterPage({
//     super.key,
//     required this.onTap,
//   });

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   // Text editing controllers
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController phonenumberController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   final ApiService apiService = ApiService();

//   void _signup() async {
//     if (passwordController.text != confirmPasswordController.text) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Passwords do not match')),
//       );
//       return;
//     }

//     try {
//       final response = await apiService.signup({
//         'username': usernameController.text,
//         'phoneNum': phonenumberController.text,
//         'email': emailController.text,
//         'password': passwordController.text,
//         'confirmPassword': confirmPasswordController.text,
//       });

//       // Xử lý phản hồi thành công
//       print('Signup success: $response');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Đăng ký tài khoản thành công!')),
//       );

//       // Chuyển hướng đến trang đăng nhập
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const LoginPage(onTap: null)),
//       );
//     } catch (e) {
//       // Xử lý lỗi
//       print('Signup failed: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Signup failed: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
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
//                 "Hãy tạo một tài khoản cho bạn",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Theme.of(context).colorScheme.inversePrimary,
//                 ),
//               ),
//               const SizedBox(height: 25),
//               // username textfield
//               MyTextField(
//                 controller: usernameController,
//                 hintText: "Tên đăng nhập",
//                 obscureText: false,
//               ),
//               const SizedBox(height: 10),
//               // phone number textfield
//               MyTextField(
//                 controller: phonenumberController,
//                 hintText: "Số điện thoại",
//                 obscureText: false,
//               ),
//               const SizedBox(height: 10),
//               // email textfield
//               MyTextField(
//                 controller: emailController,
//                 hintText: "Email",
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
//               // confirm password textfield
//               MyTextField(
//                 controller: confirmPasswordController,
//                 hintText: "Xác nhận mật khẩu",
//                 obscureText: true,
//               ),
//               const SizedBox(height: 10),
//               // sign up button
//               MyButton(
//                 text: "Đăng ký",
//                 onTap: _signup,
//               ),
//               const SizedBox(height: 10),
//               // already have an account? Login here
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Bạn có sẵn sàng để tạo một tài khoản?",
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.inversePrimary,
//                     ),
//                   ),
//                   const SizedBox(width: 4),
//                   GestureDetector(
//                     onTap: widget.onTap,
//                     child: Text(
//                       "Đăng nhập ngay.",
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
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../services/api_service.dart';
import 'login_page.dart'; // Import trang đăng nhập

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers
  final TextEditingController imagePathController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final ApiService apiService = ApiService();

  void _signup() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      final response = await apiService.signup({
        'imagePath': imagePathController.text,
        'username': usernameController.text,
        'phoneNum': phonenumberController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'confirmPassword': confirmPasswordController.text,
      });

      // Xử lý phản hồi thành công
      print('Signup success: $response');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng ký tài khoản thành công!')),
      );

      // Chuyển hướng đến trang đăng nhập
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage(onTap: null)),
      );
    } catch (e) {
      // Xử lý lỗi
      print('Signup failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                "Hãy tạo một tài khoản cho bạn",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 25),
              // image URL textfield
              MyTextField(
                controller: imagePathController,
                hintText: "Ảnh đại diện",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: "Tên đăng nhập",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              // phone number textfield
              MyTextField(
                controller: phonenumberController,
                hintText: "Số điện thoại",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              // email textfield
              MyTextField(
                controller: emailController,
                hintText: "Email",
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
              // confirm password textfield
              MyTextField(
                controller: confirmPasswordController,
                hintText: "Xác nhận mật khẩu",
                obscureText: true,
              ),
              const SizedBox(height: 10),
              // sign up button
              MyButton(
                text: "Đăng ký",
                onTap: _signup,
              ),
              const SizedBox(height: 10),
              // already have an account? Login here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bạn đã có tài khoản?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Đăng nhập ngay.",
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
