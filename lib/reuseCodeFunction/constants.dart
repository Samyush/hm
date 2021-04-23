import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF158A85);
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

const kLeadingNav = IconButton(
  icon: Icon(
    Icons.food_bank,
    color: Colors.redAccent,
    size: 35,
  ),
  onPressed: null,
);

const kAppbarTitle = Text(
  'Academy of Culinary Arts',
  style: kTextAppBarStyle,
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
