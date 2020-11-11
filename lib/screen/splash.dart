import 'package:flutter/material.dart';
import 'package:hm/screen/welcomescreen.dart';
import 'package:hm/support/splashHelper.dart';

class SplashDisplay extends StatefulWidget {
  static const String id = 'splash_page';

  @override
  _SplashDisplayState createState() => _SplashDisplayState();
}

class _SplashDisplayState extends State<SplashDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: SplashScreen(
              title: Text(
                'Culinary Arts',
                style: new TextStyle(
                  color: Colors.red,
                  fontFamily: 'Acme',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              seconds: 5,
              // navigateAfterSeconds: BottomNavigationss(),
              navigateAfterSeconds: WelcomeScreen(),

              image: Image.asset(
                'images/logo.jpg',
//                  height: 60,
              ),
              backgroundColor: Colors.white,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 150.0,
              onClick: () => print("Flutter Egypt"),
              loaderColor: Colors.red,
              loadingText: Text(
                'POWERED by SAMYUSH',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Acme',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
