import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'SearchPage.dart';
import 'Models/AirResponse.dart';
import 'API.dart' as API;
import 'MainPageView.dart';
import 'AQIView.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final String mAirResponse = "AirResponse";
  Color _primaryColor = Colors.black;
  AirResponse _response;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    getFromLocal().then((airResponse) {
      if (airResponse != null) {
        setState(() {
          this._response = airResponse;
        });
      }
    });
    Future response = API.getAirReport();
    response.then((response) {
      final responseJson = json.decode(response.body);
      final airResponse = new AirResponse.fromJson(responseJson);
      saveToLocal(airResponse);
      setState(() {
        this._response = airResponse;
      });
    }).catchError((error) {
      print(error);
    }).whenComplete(() {});
  }

  saveToLocal(AirResponse airResponse) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonStr = json.encode(airResponse);
    prefs.setString(mAirResponse, jsonStr);
  }

  Future<AirResponse> getFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(mAirResponse);
    if (jsonStr == null) {
      return null;
    }
    return AirResponse.fromJson(json.decode(jsonStr));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: _primaryColor,
      ),
      home: NotificationListener<StatusBarColorNotification>(
        child: MainPageView(response: _response, tap: getData, routeObserver: routeObserver),
        onNotification: (notification) {
          setState(() {
            _primaryColor = notification.color;
          });
        },
      ),
      navigatorObservers: [routeObserver],
      routes: <String, WidgetBuilder>{
        '/searchPage': (BuildContext context) => SearchPage(),
      },
    );
  }
}
