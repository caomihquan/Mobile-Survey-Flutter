import 'dart:convert';
import 'package:pokedex/configs/apiConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSate {
  static dynamic getUser() async {
    var prefs = await SharedPreferences.getInstance();
    var response = prefs.getString(ApiConfig.CONSTANT_KEY) ?? '';
    return jsonDecode(response);
  }

  static void setUser(dynamic name) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(ApiConfig.CONSTANT_KEY, name);
  }
}
