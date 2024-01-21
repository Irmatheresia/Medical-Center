import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Dokter {
  final String nama;
  final double rating;
  final String spesialis;
  final String img;
  final String detail;

  Dokter(this.nama, this.rating, this.spesialis, this.img, this.detail);

  factory Dokter.fromJson(Map<String, dynamic> parsedJson) {
    final nama = parsedJson['nama'] as String;
    final rating = parsedJson['rating'] * 1.0 as double;
    final spesialis = parsedJson['spesialis'] as String;
    final img = parsedJson['img'] as String;
    final detail = parsedJson['detail'] as String;

    return Dokter(nama, rating, spesialis, img, detail);
  }
}

class HttpHelper {
  final String _urlBase = "http://192.168.100.131:8000/lib/Data/dokter.json";

  Stream<List> fetchKardiologiDoctors() async* {
    var url = Uri.parse(_urlBase);
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      List sukamulah = jsonResponse.map((i) => Dokter.fromJson(i)).toList();
      int startIndex = 0;
      const int doctorsPerPage = 11;

      while (startIndex < sukamulah.length) {
        final endIndex = startIndex + doctorsPerPage;
        yield sukamulah.sublist(startIndex, endIndex);

        startIndex = endIndex;
        await Future.delayed(const Duration(seconds: 2));
      }
    }
  }
}
