import 'package:flutter/material.dart';

class ReuseCard extends StatelessWidget {
  ReuseCard({this.onTap, this.cardChild, this.colour, this.height});

  final Function onTap;
  final Widget cardChild;
  final Color colour;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        child: cardChild,
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
