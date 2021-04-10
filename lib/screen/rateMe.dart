import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm/componentBuilders/reuseCardBuilder.dart';
import 'package:hm/networking/serverConnection/perUserDemand/apiRateMyCollege.dart';
import 'package:hm/reuseCodeFunction/constants.dart';
import 'package:hm/reuseCodeFunction/iconContent.dart';

import '../networking/serverConnection/perUserDemand/UserDataPuller.dart';

enum Emoji { happy, sad, none }

class RateMe extends StatefulWidget {
  @override
  _RateMeState createState() => _RateMeState();
}

class _RateMeState extends State<RateMe> {
  Emoji selectedEmoji;
  int happy = 1;
  int ratingSlider = 0;
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
          ratingSlider = dataIs['user']['rating'];
        }
      } catch (e) {
        ratingSlider = 5;
        print('to be rated');
      }
    });
    // ratingSlider =
  }

  //The following method is used for rating data
  void toRate(String label) async {
    var userData = await MyRating().rateIt(happy, ratingSlider);
    if (userData != null) {
      final snackBar = SnackBar(
        content: Text(label),
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
        backgroundColor: Colors.white,
      ),
      body: _connectionStatus
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
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
                  flex: 2,
                  child: ReuseCard(
                    colour: kInactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Rate My College',
                          style: kTextLabelStyle.copyWith(fontSize: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.star),
                            Text(
                              ratingSlider.toString(),
                              style: kNumberTextStyle,
                            ),
                            Icon(FontAwesomeIcons.star),
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
                          onTap: () {
                            setState(() {
                              selectedEmoji = Emoji.none;
                              happy = 2;
                              ratingSlider = 0;
                            });
                            toRate('Reset Successful,');
                          },
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                CupertinoIcons.gobackward,
                                size: 40,
                                color: Colors.black,
                              ),
                              Text(
                                'RESET',
                                style: kTextLabelStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReuseCard(
                          colour: kInactiveColor,
                          onTap: () {
                            toRate('Rated Successfully, Thank you!');
                            // setState(() {});
                          },
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                CupertinoIcons.paperplane_fill,
                                size: 40,
                                color: Colors.black,
                              ),
                              Text(
                                'RATE ME',
                                style: kTextLabelStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: SpinKitWave(
                color: Colors.red,
                size: 50.0,
              ),
            ),
    );
  }
}
