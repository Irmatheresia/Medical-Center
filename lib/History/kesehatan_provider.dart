import 'package:flutter/material.dart';
import 'dart:convert';

class KesehatanProvider extends ChangeNotifier {
  initialData() async {
    setData = rawatinap;
  }

  final rawatinap = {
    "data": [
      {
        "id": "00001A",
        "penyakit": "Pneumonia",
        "img":
            "https://i.pinimg.com/564x/fb/dd/1e/fbdd1e29359b8cb469581170ada88384.jpg",
        "spesialis": 'Pulmonologi',
        "dokter": 'dr. Zean N H Sp.P',
        "tanggal": '10 Juni 2023',
        "pembayaran": "BPJS"
      },
      {
        "id": "00002A",
        "penyakit": "Vertigo",
        "img":
            "https://i.pinimg.com/564x/fb/dd/1e/fbdd1e29359b8cb469581170ada88384.jpg",
        "spesialis": 'Neurolog',
        "dokter": 'dr. Cio H Sp.N',
        "tanggal": '10 September 2022',
        "pembayaran": "BPJS"
      },
      {
        "id": "00003A",
        "penyakit": "Gastritis",
        "img":
            "https://i.pinimg.com/564x/fb/dd/1e/fbdd1e29359b8cb469581170ada88384.jpg",
        "spesialis": 'Gastroenterologi',
        "dokter": 'dr. Shani I Sp.PD-KGEH',
        "tanggal": '25 Oktober 2021',
        "pembayaran": "BPJS"
      },
    ]
  };
  final rawatjalan = {
    "data": [
      {
        "id": "00001B",
        "penyakit": "Gingivitis",
        "img":
            "https://i.pinimg.com/564x/fb/dd/1e/fbdd1e29359b8cb469581170ada88384.jpg",
        "spesialis": 'Dentist',
        "dokter": 'dr. Aran N H S.K.G',
        "tanggal": '13 Juli 2021',
        "pembayaran": "BPJS"
      },
      {
        "id": "00002B",
        "penyakit": "Ronten Tulang Belakang/AP-Lat-Oblique",
        "img":
            "https://i.pinimg.com/564x/2d/ef/25/2def250000678589320721c39755ded2.jpg",
        "spesialis": 'Ortopedi',
        "dokter": 'dr. Angel Christy N H Sp.OT',
        "tanggal": '17 Januari 2019',
        "pembayaran": "BPJS"
      },
    ]
  };

  dynamic _data;
  dynamic get data => _data;
  set setData(val) {
    var tmp = json.encode(val);
    _data = json.decode(tmp);

    notifyListeners();
  }

  ubahList(val) {
    if (val == 'rawatinap') {
      setData = rawatinap;
    } else {
      setData = rawatjalan;
    }
  }
}
