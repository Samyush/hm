import 'networking.dart';

const apiKey = 'd178378b1731bce447b8875cdacaf2dd';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  get http => null;

  Future<dynamic> login(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getUserDetail() async {
    NetworkHelper networkHelper = NetworkHelper('');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // signIn(String email, pass) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   Map data = {'email': email, 'password': pass};
  //   var jsonResponse = null;
  //   var response =
  //   await http.post("http://192.168.31.47:8000/api/login", body: data);
  //   if (response.statusCode == 200) {
  //     jsonResponse = json.decode(response.body);
  //     print('Response status: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //     if (jsonResponse != null) {
  //       setState(() {
  //         showSpinner = false;
  //       });
  //       sharedPreferences.setString("token", jsonResponse['token']);
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(
  //               builder: (BuildContext context) => BottomNavigationss()),
  //               (Route<dynamic> route) => false);
  //     }
  //   } else {
  //     setState(() {
  //       showSpinner = false;
  //       _showMyDialog();
  //     });
  //     print(response.body);
  //   }
  // }
}
