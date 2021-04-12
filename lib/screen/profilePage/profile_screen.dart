import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:hm/networking/serverConnection/perUserDemand/UserDataPuller.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottomNavigation.dart';
import 'Components/profileConstants.dart';
import 'Components/profile_list_item.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SharedPreferences sharedPreferences;

  int idTxt;

  String nameTxt;

  String emailTxt;

  String yearTxt;

  String happy;

  String ratingTxt;

  bool showSpinner = true;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    var userData = await ApiPuller().getUserDetail();

    return updateUI(
      userData,
    );
  }

  void updateUI(dynamic dataIs) {
    setState(() {
      if (dataIs == null) {
        idTxt = 0;
        nameTxt = 'Error';
        emailTxt = 'Error';
        yearTxt = 'Error';
        ratingTxt = 'Error';
        happy = 'Error';
        showSpinner = true;
        return;
      }
      idTxt = dataIs['user']['id'];
      nameTxt = dataIs['user']['name'];
      emailTxt = dataIs['user']['email'];
      yearTxt = dataIs['user']['year_id'].toString();
      ratingTxt = dataIs['user']['rating'].toString();
      if (dataIs['user']['happy'].toString() == '1')
        happy = 'yes';
      else if (dataIs['user']['happy'].toString() == '0')
        happy = 'Not Happy';
      else
        happy = 'Not Updated';
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage("images/culinary.png")),
                // Positioned(
                //   right: 20.0,
                //   bottom: 20.0,
                // child: InkWell(
                //   onTap: () {
                //     showModalBottomSheet(
                //       context: context,
                //       builder: ((builder) => null
                //           // SignUpFormState().bottomSheet()
                //           ),
                //     );
                //   },
                //   // child: Icon(
                //   //   Icons.camera_alt,
                //   //   color: kPrimaryColor,
                //   //   size: 28.0,
                //   // ),
                // ),
                // )
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            'Academy of Culinary Arts & Hospitality Management',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'Lagankhel, Lalitpur',
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Container(
            height: kSpacingUnit.w * 4,
            width: kSpacingUnit.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
              // color: Theme.of(context).accentColor,
              color: Colors.amber,
            ),
            child: Center(
              child: Text(
                'Year: ' + '$yearTxt',
                style: kButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          children: <Widget>[
            SizedBox(height: kSpacingUnit.w * 5),
            profileInfo,
            Expanded(
              child: ListView(
                children: <Widget>[
                  ProfileListItem(
                    icon: LineAwesomeIcons.user_shield,
                    text: 'Name: $nameTxt (id: $idTxt)',
                    hasNavigation: false,
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.mail_bulk,
                    text: 'Email: $emailTxt',
                    hasNavigation: false,
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.smiling_face,
                    text: 'Happy? : $happy',
                    hasNavigation: false,
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.history,
                    text: 'My ratings: $ratingTxt',
                    hasNavigation: false,
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    text: 'Home',
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BottomNavigationPage()),
                          (Route<dynamic> route) => false);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
