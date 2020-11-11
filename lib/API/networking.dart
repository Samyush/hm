import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkHelper {
  SharedPreferences sharedPreferences;

  NetworkHelper(this.url);

  final String url;
  String token;

  Future getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");

    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
