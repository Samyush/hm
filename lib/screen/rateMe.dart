import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm/commonFunction/constants.dart';
import 'package:hm/commonFunction/reuse_card.dart';
import 'package:hm/commonFunction/roundedIconButton.dart';
import 'package:hm/commonFunction/toDelete2.dart';
import 'package:hm/networking/serverConnection/apiRateMyCollege.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // rascal();
  }

  //Todo:: to change the below code to getAuth user data and update UI
  void rascal() async {
    var userData = await MyRating().rateIt(happy, ratingSlider);
    if (userData != null) {
      final snackBar = SnackBar(
        content: Text('Rated Successfully, Thank you!'),
        action: SnackBarAction(
          label: 'Undo',
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
              rascal();
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
