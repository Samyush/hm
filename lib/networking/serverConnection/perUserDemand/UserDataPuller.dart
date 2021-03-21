import 'package:hm/networking/allAPI/allAPI.dart';

import '../mainConnector.dart';

class ApiPuller {
  // Profile ui = Profile();
  //kApiCurrentUsr has the api kept in constant file
  Future<dynamic> getUserDetail() async {
    NetworkHelper networkHelper = NetworkHelper(kApiCurrentUsr);

    var userDetail = await networkHelper.getData();
    print(userDetail);

    // Profile(userDetail: userDetail);

    return userDetail;
  }
}
//its helping code are in line 29 to 45 of location_screen to update in profile.dart page
