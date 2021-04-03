import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm/componentBuilders/reuseCardBuilder.dart';
import 'package:hm/componentBuilders/roundedIconButton.dart';
import 'package:hm/networking/serverConnection/perUserDemand/apiRateMyCollege.dart';
import 'package:hm/reuseCodeFunction/constants.dart';
import 'package:hm/reuseCodeFunction/iconContent.dart';

import '../networking/serverConnection/perUserDemand/UserDataPuller.dart';

//will add emoji my clg and rating feature here

enum Emoji { happy, veryHappy, sad, verySad }

class RateMe extends StatefulWidget {
  @override
  _RateMeState createState() => _RateMeState();
}

class _RateMeState extends State<RateMe> {
  Emoji selectedEmoji;
  int happy = 1;
  int ratingSlider = 5;
  int collegeInfrastructure = 10;
  int educationQuality = 10;

  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    getUserData();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    // rascal();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        // case ConnectivityResult.none:
        setState(() => _connectionStatus = true);
        break;
      default:
        setState(() => _connectionStatus = false);
        break;
    }
  }

  void getUserData() async {
    var userData = await ApiPuller().getUserDetail();

    return updateUI(
      userData,
    );
  }

  //this method here makes the change in UI as the users rating
  void updateUI(dynamic dataIs) {
    print(dataIs);
    setState(() {
      try {
        if (dataIs['user']['happy'].toString() == '1' &&
            dataIs['user']['rating'] != null) {
          happy = 1;
          selectedEmoji = Emoji.sad;
          ratingSlider = dataIs['user']['rating'];
        } else if (dataIs['user']['happy'].toString() == '0') {
          happy = 0;
          selectedEmoji = Emoji.happy;
        }
      } catch (e) {
        ratingSlider = 5;
        print('to be rated');
      }
    });
    // ratingSlider =
  }

  //The following method is used for rating data
  void toRate() async {
    var userData = await MyRating().rateIt(happy, ratingSlider);
    if (userData != null) {
      final snackBar = SnackBar(
        content: Text('Rated Successfully, Thank you!'),
        action: SnackBarAction(
          label: 'Done',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: Text('Sorry, please try again!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: kLeadingNav,
        title: _connectionStatus
            ? kAppbarTitle
            : Center(
                child: Text(
                  'Check Network Status',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.shareSquare,
              color: Colors.black,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              toRate();
              // MyRating().rateIt(happy, ratingSlider);
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseCard(
                    onTap: () {
                      setState(() {
                        selectedEmoji = Emoji.sad;
                        happy = 1;
                      });
                    },
                    colour: selectedEmoji == Emoji.sad
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: IconCont(
                      icon: FontAwesomeIcons.smile,
                      label: 'HAPPY',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseCard(
                    onTap: () {
                      setState(() {
                        selectedEmoji = Emoji.happy;
                        happy = 0;
                      });
                    },
                    colour: selectedEmoji == Emoji.happy
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: IconCont(
                      icon: FontAwesomeIcons.frownOpen,
                      label: 'NOT HAPPY',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
//            flex: 3,
            child: ReuseCard(
              colour: kInactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Rate My College',
                    style: kTextLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.star
                          //style: kTextLabelStyle,
                          ),
                      Text(
                        ratingSlider.toString(),
                        style: kNumberTextStyle,
                      ),
                      Icon(FontAwesomeIcons.star
                          //style: kTextLabelStyle,
                          ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      value: ratingSlider.toDouble(),
                      min: 0.0,
                      max: 10.0,
//                      activeColor: Color(0xFFEB1555),
//                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          ratingSlider = newValue.toInt();
                        });
                        print(newValue);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseCard(
                    colour: kInactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'College infrastructure',
                          style: kTextLabelStyle,
                        ),
                        Text(
                          collegeInfrastructure.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.thumbsDown,
                              onPressed: () {
                                if (collegeInfrastructure >= 0)
                                  setState(() {
                                    collegeInfrastructure--;
                                  });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.thumbsUp,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (collegeInfrastructure < 10)
                                  setState(() {
                                    collegeInfrastructure++;
                                  });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseCard(
                    colour: kInactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Education Quality',
                          style: kTextLabelStyle,
                        ),
                        Text(
                          educationQuality.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.thumbsDown,
                              onPressed: () {
                                if (educationQuality >= 0)
                                  setState(() {
                                    educationQuality--;
                                  });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.thumbsUp,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (educationQuality < 10)
                                  setState(() {
                                    educationQuality++;
                                  });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
