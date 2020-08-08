import 'package:flutter/material.dart';
import 'package:hm/screen/groupMessage.dart';
import '../reuse_card.dart';
import '../constants.dart';
import 'sliderImg.dart';
import 'package:url_launcher/url_launcher.dart';

enum Gender { male, female }
double h1 = 75;

class MyHomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _launched;
  Gender selectedGender;
  String height = 'Photos';
  String _phone = '+977-01-5522909';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
//    SliderImg.dispose();
    SliderImg();
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
//        scaffoldKey.currentState.showSnackBar(snackBar);
              Navigator.pushNamed(context, ChatScreen.id);
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
                      image: AssetImage('images/a2.gif'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = _launchInWebViewWithJavaScript(
                          'https://drive.google.com/drive/folders/1bdEi3N0AT1HKvkV0AEtyaXEA3kjq6Veq?usp=sharing');
                    });
                  },
                  colour: Color(0xFF1268BB),
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
                  colour: Color(0xFF676767),
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
                  colour: Color(0xFF838587),
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
                      image: AssetImage('images/cal.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = _makePhoneCall('tel:$_phone');
                    });
                  },
                  colour: Color(0xFF1268BB),
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
                  colour: Color(0xFFB1B1B1),
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
                  colour: Color(0xFFCDCDCD),
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
                  colour: Color(0xFF1268BB),
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
