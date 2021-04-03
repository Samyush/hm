import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:hm/componentBuilders/rounded_button.dart';

import 'bottomNavigation.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'images/cLogo.png',
                  // width: MediaQuery.of(context).size.width,
                ),
                height: 100.0,
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              title: 'Log In',
              color: Colors.lightBlue,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, BottomNavigationPage.id);
                // getUserDetails();
              },
              title: 'Already Logged In',
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
