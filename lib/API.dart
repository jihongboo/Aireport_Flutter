import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

final token = "ff6bd257aab3a6d9a4f0b29625dd9d3668276c7d";

final String _mCityUid = "CityUid";


setCityUid(int uid) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(_mCityUid, uid.toString());
}

Future<String> get _cityUid async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final uid = prefs.getString(_mCityUid);
  return uid;
}

getAirReport() async {
  final uid = await _cityUid;
  final city = uid == null ? "here" : "@$uid";
  final url = "https://api.waqi.info/feed/$city/?token=$token";
  return http.get(url);
}

getCities(String keyword) async {
  final url = "https://api.waqi.info/search/?token=$token&keyword=$keyword";
  return http.get(url);
}
