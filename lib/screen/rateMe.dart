import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm/commonFunction/constants.dart';
import 'package:hm/commonFunction/reuse_card.dart';
import 'package:hm/commonFunction/roundedIconButton.dart';
import 'package:hm/commonFunction/toDelete2.dart';

import 'file:///C:/FlutterApps/FYP/hm/lib/networking/serverConnection/apiRateMy.dart';

//will add emoji my clg and rating feature here

enum Emoji { happy, veryHappy, sad, verySad }

class RateMe extends StatefulWidget {
  @override
  _RateMeState createState() => _RateMeState();
}

class _RateMeState extends State<RateMe> {
  Emoji selectedEmoji;
  int height = 5;
  int weight = 70;
  int age = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // rascal();
  }

  //Todo:: to change the below code to getAuth user data and update UI
  void rascal() async {
    var userData = await MyRating().rateIt();

    return updateUI(
      userData,
    );
  }

  void updateUI(dynamic dataIs) {
    print(dataIs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: kLeadingNav,
        title: kAppbarTitle,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.shareSquare,
              color: Colors.black,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              MyRating().rateIt();
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
                        height.toString(),
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
                      value: height.toDouble(),
                      min: 0.0,
                      max: 10.0,
//                      activeColor: Color(0xFFEB1555),
//                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
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
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.thumbsDown,
                              onPressed: () {
                                setState(() {
                                  weight--;
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
                                setState(() {
                                  weight++;
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
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.thumbsDown,
                              onPressed: () {
                                setState(() {
                                  age--;
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
                                setState(() {
                                  age++;
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
