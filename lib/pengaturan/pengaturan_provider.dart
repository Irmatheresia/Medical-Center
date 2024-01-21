import 'package:flutter/material.dart';

class PengaturanProvider extends ChangeNotifier {
  Locale locale = const Locale('id', 'ID');
  void changeLocal(Locale lokal) {
    locale = lokal;
    notifyListeners();
  }
}
