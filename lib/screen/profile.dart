import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm/API/apiDataPuller.dart';
import 'package:hm/commonFunction/commonFunctions.dart';
import 'package:hm/commonFunction/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

//api called but the string values are yet to be updated

class Profile extends StatefulWidget {
  static const String id = 'profile_page';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int idTxt;
  String nameTxt;
  String emailTxt;
  bool showSpinner = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
    // updateUI(widget.userData);
    print('hello world');
  }

  void getUserData() async {
    var userData = await ApiPuller().getUserDetail();

    return updateUI(
      userData,
    );
  }

  void updateUI(dynamic dataIs) {
    setState(() {
      if (dataIs == null) {
        idTxt = 0;
        nameTxt = 'Error';
        emailTxt = 'Error';
        showSpinner = true;
        return;
      }
      idTxt = dataIs['user']['id'];
      nameTxt = dataIs['user']['name'];
      emailTxt = dataIs['user']['email'];
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: kLeadingNav,
        title: kAppbarTitle,
        backgroundColor: Colors.white,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
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
                    label: 'Student ID:  $idTxt',
                    icons: Icon(
                      Icons.perm_identity,
                      color: Colors.white,
                    ),
                  ),
                  NameCard(
                    label: 'Name: $nameTxt',
                    icons: Icon(
                      FontAwesomeIcons.child,
                      color: Colors.white,
                    ),
                  ),
                  NameCard(
                    label: 'Email: $emailTxt',
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
      ),
    );
  }
}

//to add up api updates here
