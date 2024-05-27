import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../barrel/models.dart';

class MyPref {

  Future<SharedPreferences>? _prefs;

  static const String AUTH_USER = '_hb37y3ib37';

  MyPref() {
    _prefs = SharedPreferences.getInstance();
  }

  Future<void> saveAuthUser(User user) async {

    final SharedPreferences prefs = await _prefs!;
    await prefs.setString(AUTH_USER, json.encode(user.toJson()));
  }

  Future<User?> getAuthUser() async {

    final SharedPreferences prefs = await _prefs!;

    if(prefs.containsKey(AUTH_USER)) {
      var data = json.decode(await prefs.get(AUTH_USER) as String);
      User user = User.fromJson(data);
      return user;
    }

    return null;
  }
}
