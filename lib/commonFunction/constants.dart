import 'package:flutter/material.dart';

//the link to be used is LAN adapters WiFi -> IPv4 Address
const kApiCurrentUsr = 'http://192.168.31.46:8000/api/currentUsr';
const kApiMyRating = 'http://192.168.31.46:8000/api/rateMe';
// 10.0.2.2
final String kApiLogin = "http://192.168.31.46:8000/api/login";

const kBottomContainerHeight = 70.0;
const kBottomConColor = Color(0xFFEB1555);
const kActiveColor = Color(0xFFD0B823);
const kInactiveColor = Color(0xFFD6D3CA);

const kTextLabelStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFFF71F02),
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kLargeTextStyle = TextStyle(
  fontSize: 25,
//  color: Color(0xFF8D8E98),
  fontWeight: FontWeight.bold,
);

const kTitleTxt = TextStyle(fontSize: 50, fontWeight: FontWeight.bold);

const kResultTxt = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 22,
  color: Color(0xFF24D876),
);

const kBMItxt = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold,
);

const kReview = TextStyle(
  fontSize: 22,
);

const kTextAppBarStyle = TextStyle(
  fontSize: 19,
  color: Colors.black,
//  fontFamily: 'Pacifico',
);

const kNavigationIcon = Icon(
  Icons.cancel,
  color: Colors.red,
  size: 35,
);

const kSettingsIcon = Icon(
  Icons.settings,
  color: Colors.black,
  size: 30,
);

const kLeadingNav = IconButton(
  icon: Icon(
    Icons.food_bank,
    color: Colors.redAccent,
    size: 35,
  ),
);

const kAppbarTitle = Text(
  'Academy of Culinary Arts',
  style: kTextAppBarStyle,
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.blueGrey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
