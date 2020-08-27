import 'package:flutter/material.dart';
import 'package:hm/bottomNavigation.dart';
import 'package:hm/screen/login_screen.dart';
import 'package:hm/screen/welcomescreen.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screen/splash.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
//        primaryColor: Color(0xFF111118),
        primaryColor: Colors.white,
        // scaffoldBackgroundColor: Color(0xFFCAE9BB),
      ),
//      home: MyHomePage(),
      initialRoute: SplashDisplay.id,
      routes: {
        SplashDisplay.id: (context) => SplashDisplay(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        BottomNavigationss.id: (context) => BottomNavigationss(),
      },
    );
  }
}
