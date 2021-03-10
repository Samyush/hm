import 'package:hm/commonFunction/constants.dart';

import 'mainConnector.dart';

class MyRating {
  Future<dynamic> rateIt(int happy, int rating) async {
    NetworkHelper networkHelper = NetworkHelper(kApiMyRating);

    var ratingDetails = await networkHelper.postRatings(happy, rating);
    print(ratingDetails);

    // Profile(userDetail: userDetail);

    return ratingDetails;
  }
}
