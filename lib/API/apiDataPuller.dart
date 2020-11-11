import 'networking.dart';

const apiIs = 'http://192.168.31.47:8000/api/login';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class ApiPuller {
  //
  static Future<dynamic> getUserDetail() async {
    NetworkHelper networkHelper = NetworkHelper(apiIs);

    var userDetail = await networkHelper.getData();
    print(userDetail);
    return userDetail;
  }
}
