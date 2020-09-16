//import 'dart:js';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class SliderImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 7000.0,
          width: 1000.0,
          child: Carousel(
            boxFit: BoxFit.fill,
            autoplay: true,
            autoplayDuration: const Duration(seconds: 5),
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            dotSize: 6.0,
            dotIncreasedColor: Colors.black,
            dotBgColor: Colors.transparent,
            dotPosition: DotPosition.topRight,
            dotVerticalPadding: 10.0,
            showIndicator: true,
            indicatorBgPadding: 7.0,
            borderRadius: true,
            radius: Radius.circular(0),
            images: [
              AssetImage('images/one.jpg'),
              AssetImage('images/two.jpg'),
              AssetImage('images/three.jpg'),
              AssetImage('images/four.jpg'),
              AssetImage('images/five.jpg'),
              AssetImage('images/six.jpg'),
              AssetImage('images/seven.jpg'),
              AssetImage('images/eight.jpg'),
              AssetImage('images/nine.jpg'),
              AssetImage('images/ten.jpg'),
              AssetImage('images/eleven.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
