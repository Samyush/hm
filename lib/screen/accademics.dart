import 'package:flutter/material.dart';
import 'package:hm/commonFunction/constants.dart';

//will add emoji my clg and rating feature here

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
