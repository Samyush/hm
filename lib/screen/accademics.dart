import 'package:flutter/material.dart';

import 'file:///C:/FlutterApps/workFrames/hm/lib/commonFunction/constants.dart';

class Academics extends StatefulWidget {
  @override
  _AcademicsState createState() => _AcademicsState();
}

class _AcademicsState extends State<Academics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: kLeadingNav,
        title: kAppbarTitle,
        backgroundColor: Colors.white,
      ),
    );
  }
}
