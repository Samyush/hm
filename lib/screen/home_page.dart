import 'package:flutter/material.dart';
import 'package:hm/screen/login_screen.dart';
import 'package:hm/screen/welcomescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../reuse_card.dart';
import 'sliderImg.dart';

enum Gender { male, female }

double h1 = 65;

class MyHomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SharedPreferences sharedPreferences;

  Future<void> _launched;
  Gender selectedGender;
  String height = 'Photos';
  String _phone = '+977-01-5522909';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkLoginStatus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
//    SliderImg.dispose();
    SliderImg();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }

//  for making a phone call
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _sendAMail(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

//  for opening links

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This trailing comma makes auto-formatting nicer for build methods.

      appBar: AppBar(
        leading: kLeadingNav,
        title: kAppbarTitle,
        actions: <Widget>[
          IconButton(
            icon: kNavigationIcon,
            tooltip: 'Show Snackbar',
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => WelcomeScreen()),
                  (Route<dynamic> route) => false);
//        scaffoldKey.currentState.showSnackBar(snackBar);
//               Navigator.pushNamed(context, ChatScreen.id);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: ReuseCard(
                height: 1000,
                colour: kActiveColor,
                cardChild: SliderImg(),
              ),
            ),
            Expanded(
              flex: 3,
              child: socialMedia(),
            ),
          ],
        ),
      ),

//
    );
  }

  Widget socialMedia() {
    return ListView(
      children: [
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseCard(
                  height: h1,
                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/culinary.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = _launchInWebViewWithJavaScript(
                          'https://drive.google.com/drive/folders/1bdEi3N0AT1HKvkV0AEtyaXEA3kjq6Veq?usp=sharing');
                    });
                  },
                  colour: Color(0xFF0034C2),
                ),
              ),
              Expanded(
                flex: 2,
                child: ReuseCard(
                  height: h1,
                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/website.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = _launchInWebViewWithJavaScript(
                          'https://culinaryarts.com.np/');
                    });
                  },
                  // colour: Color(0xFF676767),
                  colour: Color(0xFFD6D3CA),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: ReuseCard(
                  height: h1,

                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/gmail.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched =
                          _sendAMail('mailto: info@culinaryarts.com.np');
                    });
                  },
                  // colour: Color(0xFF838587),
                  colour: Color(0xFFD6D3CA),

//                    cardChild: IconContent(
//                      icon: FontAwesomeIcons.mars,
//                      label: 'MALE',
//                    ),
                ),
              ),
              Expanded(
                child: ReuseCard(
                  height: h1,

                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/call.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = _makePhoneCall('tel:$_phone');
                    });
                  },
                  colour: Color(0xFF127538),
//                    cardChild: IconContent(
//                      icon: FontAwesomeIcons.venus,
//                      label: 'FEMALE',
//                    ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseCard(
                  height: h1,
                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/facebook.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = _launchInWebViewWithJavaScript(
                          'https://www.facebook.com/culinaryarts.nepal/');
                    });
                  },
                  colour: Color(0xFF0034C2),
                ),
              ),
              Expanded(
                flex: 2,
                child: ReuseCard(
                  height: h1,
                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/insta.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = _launchInWebViewWithJavaScript(
                          'https://www.instagram.com/aca.nepal/');
                    });
                  },
                  // colour: Color(0xFFB1B1B1),
                  colour: Color(0xFFD6D3CA),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: ReuseCard(
                  height: h1,

                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/utube.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = _launchInWebViewWithJavaScript(
                          'https://www.youtube.com/channel/UCHPc2ESR4jv8bWwCW1Rspww');
                    });
                  },
                  // colour: Color(0xFFCDCDCD),
                  colour: Color(0xFFD6D3CA),

//                    cardChild: IconContent(
//                      icon: FontAwesomeIcons.mars,
//                      label: 'MALE',
//                    ),
                ),
              ),
              Expanded(
                child: ReuseCard(
                  height: h1,

                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/twitter.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = _makePhoneCall('tel:$_phone');
                    });
                  },
                  colour: Color(0xFF127538),
//                    cardChild: IconContent(
//                      icon: FontAwesomeIcons.venus,
//                      label: 'FEMALE',
//                    ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
