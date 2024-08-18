import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_tile.dart';
import 'package:food_delivery_app/pages/contact_us_page.dart';
import 'package:food_delivery_app/pages/favorite_page.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import '../pages/settings_page.dart';
import 'package:food_delivery_app/pages/login_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void _logout(BuildContext context) {
    // Điều hướng người dùng đến trang đăng nhập
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage(onTap: null)),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          const Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: Image(
              image: AssetImage('lib/images/logo.png'),
              width: 200,
              height: 200,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home list tile
          MyDrawerTile(
            text: "Trang chủ",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),

          //setting list title
          MyDrawerTile(
            text: "Cài đặt",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          MyDrawerTile(
            text: "Liên Hệ với chúng tối",
            icon: Icons.question_answer_rounded,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactUsPage(),
                ),
              );
            },
          ),

          MyDrawerTile(
            text: "Yêu thích",
            icon: Icons.favorite_border_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritePage(
                    favoriteFoods: [],
                  ),
                ),
              );
            },
          ),

          const Spacer(),

          //logout list title
          MyDrawerTile(
            text: "Đăng xuất",
            icon: Icons.logout,
            onTap: () => _logout(context),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
