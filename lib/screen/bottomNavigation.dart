import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hm/networking/serverConnection/perUserDemand/UserDataPuller.dart';
import 'package:hm/screen/profilePage/profile_screen.dart';
import 'package:hm/screen/rateMe.dart';
import 'package:hm/screen/search.dart';

import 'calendar/calendar.dart';
import 'home_page.dart';

class BottomNavigationPage extends StatefulWidget {
  static const String id = 'nav_page';

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndex = 0;
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
    // TODO: implement initState
    super.initState();
    ApiPuller().getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
//        color: Colors.grey,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color(0xFFC7C7C7),
        height: 55,
//        backgroundColor: Colors.black,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.search,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.school,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.calendar_today,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.person,
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
