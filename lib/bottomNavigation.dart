import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hm/screen/accademics.dart';
import 'package:hm/screen/search.dart';

import 'API/apiDataPuller.dart';
import 'screen/calendar.dart';
import 'screen/home_page.dart';
import 'screen/profile.dart';

class BottomNavigationss extends StatefulWidget {
  static const String id = 'nav_page';

  @override
  _BottomNavigationssState createState() => _BottomNavigationssState();
}

class _BottomNavigationssState extends State<BottomNavigationss> {
  int _currentIndex = 0;
  final _pages = [MyHomePage(), Searches(), Academics(), Calendar(), Profile()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiPuller.getUserDetail();
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
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
