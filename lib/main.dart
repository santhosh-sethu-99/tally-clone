import 'package:flutter/material.dart';
import 'splash_screen.dart';
// import 'package:flutter/foundation.dart';

void main() {
  runApp(
    RootRestorationScope(
      restorationId: "root",
      child: Tally(),
    ),
  );
}

class Tally extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(brightness: Brightness.dark
          // primaryColor: Colors.white70,
          ),
    );
  }
}
