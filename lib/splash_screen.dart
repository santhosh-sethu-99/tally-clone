import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(
            isCardsVisible: true,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ColorizeAnimatedTextKit(
          speed: Duration(milliseconds: 1000),
          pause: Duration(milliseconds: 1),
          // totalRepeatCount: 100,
          onTap: () {
            print("Tap Event");
          },
          text: ["TALLY"],
          textStyle: TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
          ),
          colors: [
            Colors.white,
            Colors.white,
            Colors.black,
          ],
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
