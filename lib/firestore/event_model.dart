import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String? id;
  String nama;
  String email;
  String perihal;
  String detail;

  EventModel(
      {this.id,
      required this.nama,
      required this.email,
      required this.perihal,
      required this.detail});

  Map<String, dynamic> toMap() {
    return {'nama': nama, 'email': email, 'detail': detail, 'perihal': perihal};
  }

  EventModel.fromDocSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        nama = doc.data()?["nama"],
        email = doc.data()?["email"],
        detail = doc.data()?["detail"],
        perihal = doc.data()?["perihal"];
}
