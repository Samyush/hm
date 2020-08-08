import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kBottomContainerHeight = 70.0;
const kBottomConColor = Color(0xFFEB1555);
const kActiveColor = Colors.grey;
const kInactiveColor = Color(0xFF111328);

const kTextLabelStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
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
  Icons.message,
  color: Colors.black,
  size: 35,
);

const kSettingsIcon = Icon(
  Icons.settings,
  color: Colors.black,
  size: 30,
);

const kLeadingNav = IconButton(
  icon: Icon(
    FontAwesomeIcons.heartbeat,
    color: Colors.redAccent,
  ),
);

const kAppbarTitle = Text(
  'Academy of Culinary Arts',
  style: kTextAppBarStyle,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(
    color: Colors.white,
  ),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.white, width: 2.0),
  ),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.amber,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
