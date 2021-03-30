import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hm/screen/welcomeScreen.dart';

bool isLoggedIn = true;

class SplashDisplay extends StatefulWidget {
  final Color backgroundColor;
  final dynamic onClick;
  final ImageProvider imageBackground;
  final Gradient gradientBackground;
  SplashDisplay(
      {this.onClick,
      this.backgroundColor = Colors.white,
      this.imageBackground,
      this.gradientBackground});

  static const String id = 'splash_page';

  @override
  _SplashDisplayState createState() => _SplashDisplayState();
}

class _SplashDisplayState extends State<SplashDisplay> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      // It's fairly safe to assume this is using the in-built material
      // named route component

      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) => WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new InkWell(
        onTap: widget.onClick,
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: widget.imageBackground == null
                    ? null
                    : new DecorationImage(
                        fit: BoxFit.cover,
                        image: widget.imageBackground,
                      ),
                gradient: widget.gradientBackground,
                color: widget.backgroundColor,
              ),
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
                        backgroundColor: Colors.transparent,
                        child: new Container(
                          child: Image.asset(
                            'images/logo.jpg',
//                  height: 60,
                          ),
                        ),
                        radius: 150.0,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'Culinary Arts',
                        style: new TextStyle(
                          color: Colors.red,
                          fontFamily: 'Acme',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        'POWERED by SAMYUSH',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Acme',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
