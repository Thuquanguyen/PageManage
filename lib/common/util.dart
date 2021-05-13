import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util{
  static const String PORT = "v10.0";
  static const String BASE_URL = "https://graph.facebook.com/$PORT";
  static ThemeData themeData = ThemeData(primaryColor: Colors.blue,visualDensity: VisualDensity.adaptivePlatformDensity);

  static const String KEY_TOKEN = "key_token";

  static Future<dynamic> readReferent(String key) async{
        final prefs = await SharedPreferences.getInstance();
        final value = prefs.get(key);
        return value;
  }

  static Future<bool> saveReferent(String key,String value) async{
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.setString(key, value);
    return data == null;
  }
}