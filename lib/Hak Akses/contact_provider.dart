import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
  Contact? darurat;

  void setDarurat(Contact contact) {
    darurat = contact;
    notifyListeners();
  }
}
