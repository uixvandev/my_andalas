import 'package:flutter/material.dart';
import 'package:my_andalas/Views/LoginScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const Loginscreen(),
          ),
          (route) => false);
    });
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/splashscreen.png'),
          const SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'from',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    'UNAND Information Systems Department',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}