import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hm/componentBuilders/rounded_button.dart';
import 'package:hm/networking/allAPI/allAPI.dart';
import 'package:hm/reuseCodeFunction/constants.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottomNavigation.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool showSpinner = false;
  bool _connectionStatusNegative = true;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  //

  //for wifi checker
  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        // case ConnectivityResult.none:
        setState(() => _connectionStatusNegative = false);
        break;
      default:
        setState(() => _connectionStatusNegative = true);
        break;
    }
  }

  _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('SCHOOL APPS'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Looks like there\'s an error.'),
                Text('Try again with correct credentials'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }

  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': pass};
    var jsonResponse;
    //kApiLogin is in constants.dart
    var response = await http.post(kApiLogin, body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          showSpinner = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => BottomNavigationPage()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        showSpinner = false;
        _showMyDialog();
      });
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _connectionStatusNegative
          ? Center(
              child: Text(
              'Check Network Status',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ))
          : ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      child: Hero(
                          tag: 'logo',
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200.0,
                            child: Image.asset('images/clogo.png'),
                          )),
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      controller: emailController,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Your Email'),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      controller: passwordController,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Your Password'),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    RoundedButton(
                      onPressed: () {
                        setState(
                          () {
                            showSpinner = true;
                          },
                        );
                        signIn(emailController.text, passwordController.text);
                        // Navigator.pushNamed(context, BottomNavigationss.id);
                      },
                      // onPressed: emailController.text == "" ||
                      //         passwordController.text == ""
                      //     ? _showMyDialog
                      //     : () {
                      //         setState(
                      //           () {
                      //             showSpinner = true;
                      //           },
                      //         );
                      //         signIn(emailController.text, passwordController.text);
                      //         // Navigator.pushNamed(context, BottomNavigationss.id);
                      //       },
                      title: 'Log In',
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
