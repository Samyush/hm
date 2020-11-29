import 'package:flutter/material.dart';
import 'package:hm/commonFunction/commonFunctions.dart';
import 'package:hm/screen/login_screen.dart';
import 'package:hm/screen/welcomescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commonFunction/constants.dart';
import '../commonFunction/reuse_card.dart';
import 'sliderImg.dart';

// double h1 = 65;

class MyHomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SharedPreferences sharedPreferences;

  Future<void> _launched;
  String height = 'Photos';
  String _phone = '+977-01-5522909';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //this part of code is to be completed and is for checking if the user is logged in or not but for now, it is commented
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
    );
  }

  Widget socialMedia() {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseCard(
                  // height: h1,
                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/culinary.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.launchInWebViewWithJavaScript(
                          'https://drive.google.com/drive/folders/1bdEi3N0AT1HKvkV0AEtyaXEA3kjq6Veq?usp=sharing');
                    });
                  },
                  colour: Color(0xFF0034C2),
                ),
              ),
              Expanded(
                flex: 2,
                child: ReuseCard(
                  // height: h1,
                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/website.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.launchInWebViewWithJavaScript(
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
                  // height: h1,

                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/gmail.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.sendAMail(
                          'mailto: info@culinaryarts.com.np');
                    });
                  },
                  // colour: Color(0xFF838587),
                  colour: Color(0xFFD6D3CA),
                ),
              ),
              Expanded(
                child: ReuseCard(
                  // height: h1,
                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/call.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.makePhoneCall('tel:$_phone');
                    });
                  },
                  colour: Color(0xFF127538),
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
                  // height: h1,
                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/facebook.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.launchInWebViewWithJavaScript(
                          'https://www.facebook.com/culinaryarts.nepal/');
                    });
                  },
                  colour: Color(0xFF0034C2),
                ),
              ),
              Expanded(
                flex: 2,
                child: ReuseCard(
                  // height: h1,
                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/insta.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.launchInWebViewWithJavaScript(
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
                  // height: h1,

                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/utube.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.launchInWebViewWithJavaScript(
                          'https://www.youtube.com/channel/UCHPc2ESR4jv8bWwCW1Rspww');
                    });
                  },
                  // colour: Color(0xFFCDCDCD),
                  colour: Color(0xFFD6D3CA),
                ),
              ),
              Expanded(
                child: ReuseCard(
                  // height: h1,
                  cardChild: Center(
                    child: Image(
                      image: AssetImage('images/twitter.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.makePhoneCall('tel:$_phone');
                    });
                  },
                  colour: Color(0xFF127538),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
