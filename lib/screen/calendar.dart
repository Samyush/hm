import 'package:flutter/material.dart';
import 'package:hm/calendarWork.dart';
import '../reuse_card.dart';
import '../constants.dart';

class Calendar extends StatelessWidget {
  static const String id = 'fourth_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: kLeadingNav,
        title: kAppbarTitle,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ReuseCard(
                colour: kActiveColor,
                cardChild: CalendarWork(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
