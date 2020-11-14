import 'package:flutter/material.dart';

import 'constants.dart';

class IconCont extends StatelessWidget {
  IconCont({this.icon, this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kTextLabelStyle,
        )
      ],
    );
  }
}
