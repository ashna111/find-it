import 'package:flutter/material.dart';
import 'models/splashscreen.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Internship Portal",
      theme: new ThemeData(
        fontFamily: "Alegreya",
        primaryColor: Colors.blueAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: new SplashScreen(),
    );
  }
}
