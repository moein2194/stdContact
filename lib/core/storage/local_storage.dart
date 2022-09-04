import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static const String keyUser = 'KEY_USER';


  static Future<Map<String, dynamic>?> get({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(key);

    if (json == null) return null;
    return jsonDecode(json);
  }

  static Future<void> set(
      {required String key, required Map<String, dynamic> value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  }

  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
