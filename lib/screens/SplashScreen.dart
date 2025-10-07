import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gravito/screens/TutorialScreen.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const TutorialScreen()),
      );
    });
        }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00ffffff),
      body: Stack(
        children: [
          Positioned(
            top: -80,
            left: -50,
            child: Transform.rotate(
              angle: 1.75,
              child: const Image(
                image: AssetImage('asset/images/splash.png'),
                width: 200,
                height: 263,
              ),
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('asset/images/logo.png'),
                  width: 200,
                  height: 175,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -30,
            right: -50,
            child: Transform.rotate(
              angle: 1.75,
              child: const Image(
                image: AssetImage('asset/images/splash.png'),
                width: 200,
                height: 263,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
