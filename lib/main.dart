import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'SearchPage.dart';

import 'API.dart' as API;
import 'Models/AirResponse.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    debugPaintSizeEnabled = true;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/searchPage': (BuildContext context) => SearchPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AQIView();
  }
}

class AQIView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AQIViewState();
  }
}

class AQIViewState extends State<AQIView> {
  final String mAirResponse = "AirResponse";
  var aqi = 0;
  var place = "";

  @override
  void initState() {
    super.initState();
    getData();
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

  getData() {
    getFromLocal().then((airResponse) {
      if (airResponse != null) {
        setState(() {
          aqi = airResponse.data.aqi;
          place = airResponse.data.city.name;
        });
      }
    });
    Future response = API.getAirReprot();
    response.then((response) {
      final responseJson = json.decode(response.body);
      final airResponse = new AirResponse.fromJson(responseJson);
      saveToLocal(airResponse);
      setState(() {
        aqi = airResponse.data.aqi;
        place = airResponse.data.city.name;
      });
    }).catchError((error) {
      print(error);
    }).whenComplete(() {});
  }

  Color _getColor(int aqi) {
    Color color = Color.fromARGB(255, 43, 153, 102);
    if (aqi > 300) {
      color = Color.fromARGB(255, 126, 2, 35);
    }else if (aqi > 201) {
      color = Color.fromARGB(255, 102, 0, 153);
    }else if (aqi > 150) {
      color = Color.fromARGB(255, 203, 5, 50);
    }else if (aqi > 100) {
      color = Color.fromARGB(255, 248, 153, 52);
    }else if (aqi > 50) {
      color = Color.fromARGB(255, 251, 222, 50);
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        backgroundColor: _getColor(aqi),
        body: Stack(
          alignment: const Alignment(0.0, 0.8),
          children: <Widget>[
            Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  place,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  aqi.toString(),
                  style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            )),
            IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () {
                Future future = Navigator.of(context).pushNamed("/searchPage");
                future.then((value) {
                  API.setCityUid(value);
                  getData();
                });
              },
              iconSize: 50.0,
              color: Color.fromARGB(125, 255, 255, 255),
            )
          ],
        ));
  }
}
