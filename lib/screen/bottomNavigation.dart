import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hm/networking/serverConnection/perUserDemand/UserDataPuller.dart';
import 'package:hm/screen/profilePage/profile_screen.dart';
import 'package:hm/screen/rateMe.dart';
import 'package:hm/screen/search.dart';
import 'package:hm/screen/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'calendar/calendar.dart';
import 'home_page.dart';

class BottomNavigationPage extends StatefulWidget {
  static const String id = 'nav_page';

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndex = 0;
  SharedPreferences sharedPreferences;

  final List<Widget> _pages = [
    MyHomePage(),
    Searches(),
    RateMe(),
    Calendar(),
    // LoadingScreen(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    if (ApiPuller().getUserDetail() == null) {
      _showMyDialog('Session Expired', 'Please Re-login');
    }
  }

  _showMyDialog(String label1, label2) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('SCHOOL APPS'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(label1),
                Text(label2),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                sharedPreferences.clear();
                sharedPreferences.remove('token');
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => WelcomeScreen()),
                    (Route<dynamic> route) => false);
                // setState(() {
                //   Navigator.pop(context);
                // });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
//        color: Colors.grey,
        backgroundColor: Color(0xFFC7C7C7),
        buttonBackgroundColor: Colors.white,
        height: 55,
        // backgroundColor: Colors.black,
        items: <Widget>[
          Icon(
            CupertinoIcons.house_fill,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            CupertinoIcons.rectangle_3_offgrid_fill,
            size: 25,
            color: Colors.black,
          ),
          Icon(
            CupertinoIcons.helm,
            size: 35,
            color: Colors.black,
          ),
          Icon(
            CupertinoIcons.calendar_today,
            size: 25,
            color: Colors.black,
          ),
          Icon(
            CupertinoIcons.person_alt_circle,
            size: 20,
            color: Colors.black,
          ),
        ],
//        index: 0,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.slowMiddle,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
