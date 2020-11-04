import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonFunction {
  CommonFunction({
    this.commonString,
    // this.contexter,
    this.onPressed,
  });

  final String commonString;
  // final State contexter;
  final Function onPressed;

  static Future<void> sendAMail(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  //  for making a phone call
  static Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

//  the under function is for alert box
  Future<void> showMyDialog() async {
    return showDialog<void>(
      // context: contexter,
      // context: context,
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
              onPressed: onPressed,
            ),
            FlatButton(
              child: Text('Proceed'),
              onPressed: onPressed,
            ),
          ],
        );
      },
    );
  }
}

class NameCard extends StatelessWidget {
  NameCard({this.label, this.icons});

  final String label;
  final Icon icons;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFB4B356),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: ListTile(
          leading: icons,
          title: Text(
            '$label',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Acme',
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }
}
