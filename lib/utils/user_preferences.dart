import 'package:flutter/material.dart';
import 'package:provider_test/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // Future<void> saveUser(Data data) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setInt("id", data.id);
  //   prefs.setString("token", data.token ?? "");
  //   prefs.setBool("isIntroSeen", true);
  // }

  // void removeUser() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove("id");
  //   prefs.remove("token");
  // }

  // Future<String> getToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString("token");
  //   return token ?? "";
  // }

  // Future<int> getUserId() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int? token = prefs.getInt("id");
  //   return token ?? 0;
  // }

  // Future<bool> isIntroSeen() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool("isIntroSeen") ?? false;
  // }

  static const String themeStatus = "THEMESTATUS";

  Future<void> setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint("save theme -----??$value");
    prefs.setBool(themeStatus, value);
    getTheme();
  }

  // Future<void> isVideoPlayed() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool("video", true);
  // }

  // Future<bool> getVideoPlayed() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool? token = prefs.getBool("video");
  //   return token ?? false;
  // }

  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isdarkMode = prefs.getBool(themeStatus) ?? false;
    debugPrint("isdarkMode -----??$isdarkMode");
  }
}
