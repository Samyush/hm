import 'dart:convert';

import 'package:hm/commonFunction/constants.dart';

import 'networking.dart';

int idsTxt;
String nameTxt;
String emailTxt;

class ApiPuller {
  //kApiCurrentUsr has the api kept in constant file
  static Future<dynamic> getUserDetail() async {
    NetworkHelper networkHelper = NetworkHelper(kApiCurrentUsr);

    var userDetail = await networkHelper.getData();
    print(userDetail);
    if (userDetail == null) {
      idsTxt = 0;
      nameTxt = 'Error';
      emailTxt = 'Unable to get data';
      return;
    }
    idsTxt = jsonDecode(userDetail)['user']['id'];
    idsTxt = idsTxt.toInt();
    nameTxt = jsonDecode(userDetail)['user']['name'];
    emailTxt = jsonDecode(userDetail)['user']['email'];

    return userDetail;
  }
}
//its helping code are in line 29 to 45 of location_screen to update in profile.dart page
