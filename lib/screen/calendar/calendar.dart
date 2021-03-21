import 'package:flutter/material.dart';

import '../../componentBuilders/reuseCardBuilder.dart';
import '../../reuseCodeFunction/constants.dart';
import 'calendarWork.dart';

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
