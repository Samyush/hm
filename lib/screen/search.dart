import 'package:flutter/material.dart';
//import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

import 'package:hm/commonFunction/commonFunctions.dart';

import '../commonFunction/constants.dart';
import '../commonFunction/reuse_card.dart';

class Searches extends StatefulWidget {
  static const String id = 'second_page';

  @override
  _SearchesState createState() => _SearchesState();
}

class _SearchesState extends State<Searches> {
  Future<void> _launched;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('SCHOOL APPS'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'For this to run you need Whats app pre-installed on your device.'),
                Text('Would you like to proceed?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
            FlatButton(
              child: Text('Proceed'),
              onPressed: () {
                setState(() {
//                  FlutterOpenWhatsapp.sendSingleMessage("+977 9860810828", "");
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: kLeadingNav,
        title: kAppbarTitle,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                ReuseCard(
                  // colour: Color(0xFFE8E8E8),
                  colour: Color(0xFFD6D3CA),
                  height: 110,
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.launchInWebViewWithJavaScript(
                          'https://drive.google.com/drive/folders/1CSxfGzFu4tyeNFdf2Wy0ili4lKLz3-Vq?usp=sharing');
                    });
                  },
                  cardChild: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/routine.png'),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              '     ROUTINE',
                              style:
                                  TextStyle(fontSize: 17, fontFamily: 'Acme'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ReuseCard(
                  colour: Color(0xFFFAFE0E3),
                  height: 130,
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.launchInWebViewWithJavaScript(
                          'https://drive.google.com/open?id=1dX66k6YPlV_YfjRXyxZU2VJQY4pf-w9R');
                    });
                  },
                  cardChild: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/exam.png'),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              '     EXAM ROUTINE',
                              style:
                                  TextStyle(fontSize: 17, fontFamily: 'Acme'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ReuseCard(
                  colour: Color(0xFF3EA8F5),
                  height: 150,
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.launchInWebViewWithJavaScript(
                          'https://drive.google.com/open?id=1l8aER69j9PFWNGxeiDDgwLVJlQTnzCE4');
                    });
                  },
                  cardChild: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/gallery.png'),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'SCHOOL\'s',
                                style:
                                    TextStyle(fontSize: 17, fontFamily: 'Acme'),
                              ),
                              Text(
                                'GALLERY',
                                style:
                                    TextStyle(fontSize: 17, fontFamily: 'Acme'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ReuseCard(
                  colour: Color(0xFF29D4D0),
                  height: 180,
                  cardChild: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/pp.jpg'),
                        ),
                        Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '   MESSAGE FROM',
                              style:
                                  TextStyle(fontSize: 17, fontFamily: 'Acme'),
                            ),
                            Text(
                              '   OUR PRINCIPAL',
                              style:
                                  TextStyle(fontSize: 17, fontFamily: 'Acme'),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.launchInWebViewWithJavaScript(
                          'https://drive.google.com/open?id=1hkvasLoFOSZKiN4KvZtRBDauAPpEimyg');
                    });
                  },
                ),
                ReuseCard(
                    colour: Color(0xFF29A71A),
                    height: 150,
                    cardChild: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage('images/whatsapp.png'),
                          ),
                          Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'SCHOOL\'s',
                                style:
                                    TextStyle(fontSize: 17, fontFamily: 'Acme'),
                              ),
                              Text(
                                'WHATS APP',
                                style:
                                    TextStyle(fontSize: 17, fontFamily: 'Acme'),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _showMyDialog();
                      });
                    }),
                ReuseCard(
                  colour: Color(0xFFBFD731),
                  height: 130,
                  cardChild: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/suggestion.png'),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'GROW BETTER',
                              style:
                                  TextStyle(fontSize: 17, fontFamily: 'Acme'),
                            ),
                            Text(
                              'SUGGESTIONS',
                              style:
                                  TextStyle(fontSize: 17, fontFamily: 'Acme'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.sendAMail(
                          'mailto: samyushmaharjan@outlook.com');
                    });
                  },
                ),
                ReuseCard(
                  colour: Color(0xFFD6D3CA),
                  height: 110,
                  cardChild: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/rocketGo.gif'),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'ABOUT THE',
                              style:
                                  TextStyle(fontSize: 17, fontFamily: 'Acme'),
                            ),
                            Text(
                              'DEVELOPER',
                              style:
                                  TextStyle(fontSize: 17, fontFamily: 'Acme'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _launched = CommonFunction.launchInWebViewWithJavaScript(
                          'https://www.facebook.com/samyush.maharjan');
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
