import 'networking.dart';

const apiIs = 'http://192.168.56.1:8000/api/currentUsr';

class ApiPuller {
  //
  static Future<dynamic> getUserDetail() async {
    NetworkHelper networkHelper = NetworkHelper(apiIs);

    var userDetail = await networkHelper.getData();
    print(userDetail);
    return userDetail;
  }
}
