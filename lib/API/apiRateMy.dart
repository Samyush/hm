import 'package:hm/commonFunction/constants.dart';

import 'networking.dart';

class MyRating {
  Future<dynamic> rateIt() async {
    NetworkHelper networkHelper = NetworkHelper(kApiMyRating);

    var ratingDetails = await networkHelper.postRatings(true, 20);
    print(ratingDetails);

    // Profile(userDetail: userDetail);

    return ratingDetails;
  }
}
