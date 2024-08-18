import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/splash.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(providers: [
      // theme provider
      ChangeNotifierProvider(create: (context) =>ThemeProvider(),
      ),

      // restaurant provider
      ChangeNotifierProvider(create: (context) => Restaurant(),
      ),
    ],
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Splash(),
    theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

