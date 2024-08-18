// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/pages/account_page.dart';
// import 'package:food_delivery_app/themes/theme_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:food_delivery_app/pages/privacy_page.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Cài đặt",
//           style: TextStyle(
//             fontSize: 20, // Tăng kích thước chữ
//             fontWeight: FontWeight.bold, // Làm chữ đậm
//             color: colorScheme.onSurface, // Màu chữ
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: colorScheme.surface,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
//         children: [
//           _buildSettingsItem(
//             context,
//             title: "Tài khoản",
//             icon: Icons.person,
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AccountPage()),
//               );
//             },
//           ),
//           _buildSettingsItem(
//             context,
//             title: "Bảo mật và quyền riêng tư",
//             icon: Icons.lock,
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PrivacyPage()),
//               );
//             },
//           ),
//           _buildSettingsItem(
//             context,
//             title: "Thanh toán và đơn hàng",
//             icon: Icons.payment,
//           ),
//           _buildSettingsSwitch(
//             context,
//             title: "Chế độ Sáng/Tối",
//             icon: Icons.brightness_6,
//             value: Provider.of<ThemeProvider>(context).isDarkMode,
//             onChanged: (value) {
//               Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
//             },
//           ),
//           _buildSettingsSwitch(
//             context,
//             title: "Thông báo",
//             icon: Icons.notifications,
//             value: Provider.of<ThemeProvider>(context).notificationsEnabled,
//             onChanged: (value) {
//               Provider.of<ThemeProvider>(context, listen: false).toggleNotifications();
//             },
//           ),
//           _buildSettingsDropdown(
//             context,
//             title: "Ngôn ngữ",
//             icon: Icons.language,
//             value: Provider.of<ThemeProvider>(context).selectedLanguage,
//             items: ['vi', 'en', 'es'],
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 Provider.of<ThemeProvider>(context, listen: false).changeLanguage(newValue);
//               }
//             },
//           ),
//           _buildSettingsItem(
//             context,
//             title: "Thông tin ứng dụng",
//             icon: Icons.info,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingsItem(BuildContext context, {required String title, required IconData icon, VoidCallback? onTap}) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: colorScheme.secondary,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black26,
//               blurRadius: 4,
//               offset: Offset(2, 2),
//             ),
//           ],
//         ),
//         margin: const EdgeInsets.symmetric(vertical: 10),
//         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Icon(icon, color: colorScheme.inversePrimary),
//                 const SizedBox(width: 10),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color: colorScheme.inversePrimary,
//                   ),
//                 ),
//               ],
//             ),
//             Icon(Icons.arrow_forward_ios, color: colorScheme.inversePrimary),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSettingsSwitch(BuildContext context, {required String title, required IconData icon, required bool value, required ValueChanged<bool> onChanged}) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return Container(
//       decoration: BoxDecoration(
//         color: colorScheme.secondary,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 4,
//             offset: Offset(2, 2),
//           ),
//         ],
//       ),
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Icon(icon, color: colorScheme.inversePrimary),
//               const SizedBox(width: 10),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color: colorScheme.inversePrimary,
//                 ),
//               ),
//             ],
//           ),
//           CupertinoSwitch(
//             value: value,
//             onChanged: onChanged,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingsDropdown(BuildContext context, {required String title, required IconData icon, required String value, required List<String> items, required ValueChanged<String?> onChanged}) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return Container(
//       decoration: BoxDecoration(
//         color: colorScheme.secondary,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 4,
//             offset: Offset(2, 2),
//           ),
//         ],
//       ),
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Icon(icon, color: colorScheme.inversePrimary),
//               const SizedBox(width: 10),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color: colorScheme.inversePrimary,
//                 ),
//               ),
//             ],
//           ),
//           DropdownButton<String>(
//             value: value,
//             items: items.map((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             onChanged: onChanged,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/account_page.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/pages/privacy_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cài đặt",
          style: TextStyle(
            fontSize: 20, // Tăng kích thước chữ
            fontWeight: FontWeight.bold, // Làm chữ đậm
            color: colorScheme.onSurface, // Màu chữ
          ),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        automaticallyImplyLeading: false, // Ngăn tự động thêm nút back
        leading: SizedBox.shrink(), // Sử dụng SizedBox để không có icon
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        children: [
          _buildSettingsItem(
            context,
            title: "Tài khoản",
            icon: Icons.person,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()),
              );
            },
          ),
          _buildSettingsItem(
            context,
            title: "Bảo mật và quyền riêng tư",
            icon: Icons.lock,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPage()),
              );
            },
          ),
          _buildSettingsItem(
            context,
            title: "Thanh toán và đơn hàng",
            icon: Icons.payment,
          ),
          _buildSettingsSwitch(
            context,
            title: "Chế độ Sáng/Tối",
            icon: Icons.brightness_6,
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (value) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
          _buildSettingsSwitch(
            context,
            title: "Thông báo",
            icon: Icons.notifications,
            value: Provider.of<ThemeProvider>(context).notificationsEnabled,
            onChanged: (value) {
              Provider.of<ThemeProvider>(context, listen: false)
                  .toggleNotifications();
            },
          ),
          _buildSettingsDropdown(
            context,
            title: "Ngôn ngữ",
            icon: Icons.language,
            value: Provider.of<ThemeProvider>(context).selectedLanguage,
            items: ['vi', 'en', 'es'],
            onChanged: (String? newValue) {
              if (newValue != null) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .changeLanguage(newValue);
              }
            },
          ),
          _buildSettingsItem(
            context,
            title: "Thông tin ứng dụng",
            icon: Icons.info,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context,
      {required String title, required IconData icon, VoidCallback? onTap}) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: colorScheme.inversePrimary),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, color: colorScheme.inversePrimary),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSwitch(BuildContext context,
      {required String title,
      required IconData icon,
      required bool value,
      required ValueChanged<bool> onChanged}) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: colorScheme.inversePrimary),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsDropdown(BuildContext context,
      {required String title,
      required IconData icon,
      required String value,
      required List<String> items,
      required ValueChanged<String?> onChanged}) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: colorScheme.inversePrimary),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          DropdownButton<String>(
            value: value,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
