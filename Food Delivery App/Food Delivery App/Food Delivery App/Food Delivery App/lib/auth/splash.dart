import 'package:flutter/material.dart';
import 'dart:async';
import 'package:food_delivery_app/auth/login_or_register.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(Duration(seconds: 3), navigateToLoginOrRegister);
  }

  void navigateToLoginOrRegister() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginOrRegister()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToLoginOrRegister,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('lib/images/logo.png'),
                    width: 300, 
                    height: 300, 
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Chào mừng bạn đến với Food Delivery',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, 
                    ),
                  ),
                  SizedBox(height: 5),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Loading...',
                    style: TextStyle(color: Colors.white), 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
