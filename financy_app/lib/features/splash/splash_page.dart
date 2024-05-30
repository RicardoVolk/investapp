import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
            Color(0xff63B5AF),
            Color(0xff438863)]
            ),
        ),
        child: const Text ('Financy', style: TextStyle(
          color: Colors.white,
          fontSize: 50.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      ),
    );
  }
}