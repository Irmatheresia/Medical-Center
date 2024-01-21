import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider with ChangeNotifier {
  late SharedPreferences _prefs;

  SharedPreferencesProvider() {
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    notifyListeners();
  }

  bool isLoggedIn() {
    return _prefs?.getBool('isLoggedIn') ?? false;
  }

  void setLoggedIn(bool value) {
    _prefs?.setBool('isLoggedIn', value);
    notifyListeners();
  }
}
