import 'package:flutter/material.dart';
import 'dart:async';
import 'home_page.dart';

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

// Splash Screen
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
      () => handleTimeout(),
    );
  }

  void handleTimeout() {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) => new HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                  flex: 2,
                  child: new Container(
                      child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: new Icon(
                          Icons.gesture,
                          color: Colors.black54,
                          size: 50.0,
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      new Text("Internship Portal",
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ))),
              new Expanded(
                flex: 1,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20),
                    ),
                    new Text(
                      "Communicate.Build Confidence.",
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontStyle: FontStyle.normal),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
