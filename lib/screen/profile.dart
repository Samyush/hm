import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm/commonFunction/commonFunctions.dart';
import 'package:hm/commonFunction/constants.dart';

//have to add api calling and update the logged in user info here

class Profile extends StatefulWidget {
  static const String id = 'profile_page';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: kLeadingNav,
        title: kAppbarTitle,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/4.png'),
                ),
                Text(
                  'Academy of Culinary Arts & Hospitality Management',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
                Text(
                  'Lagankhel, Lalitpur',
                  style: TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 250,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                NameCard(
                  label: 'Student ID:  S001',
                  icons: Icon(
                    Icons.perm_identity,
                    color: Colors.white,
                  ),
                ),
                NameCard(
                  label: 'Name: Tom Cruise',
                  icons: Icon(
                    FontAwesomeIcons.child,
                    color: Colors.white,
                  ),
                ),
                NameCard(
                  label: 'Year: 1st',
                  icons: Icon(
                    FontAwesomeIcons.voteYea,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//to add up api updates here
