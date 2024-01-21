import 'package:flutter/material.dart';
import 'package:flutter_application_1/kategori.dart';
import 'package:flutter_application_1/pengaturan/pengaturan_provider.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({super.key});

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<PengaturanProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Title-Gantibahasa".i18n()),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Bahasa Indonesia"),
            tileColor: prov.locale == const Locale('id', 'ID')
                ? Colors.blue[300]
                : Colors.white,
            onLongPress: () {
              prov.changeLocal(const Locale('id', 'ID'));
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text(
                          'Bahasa Berhasil Diganti Menjadi Bahasa Indonesia'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              prov.changeLocal(const Locale('id', 'ID'));
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DoctorSearchPage()));
                            },
                            child: Text("Kembali Ke Beranda"))
                      ],
                    );
                  });
            },
          ),
          ListTile(
            title: const Text("English"),
            tileColor: prov.locale == const Locale('en', 'US')
                ? Colors.blue[300]
                : Colors.white,
            onLongPress: () {
              prov.changeLocal(const Locale('en', 'US'));
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text(
                          'Language Successfully Changed to English'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              prov.changeLocal(const Locale('en', 'US'));
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DoctorSearchPage()));
                            },
                            child: Text("Back To Home"))
                      ],
                    );
                  });
            },
          ),
          ListTile(
            title: const Text("Arabic"),
            tileColor: prov.locale == const Locale('ar', 'SA')
                ? Colors.blue[300]
                : Colors.white,
            onLongPress: () {
              prov.changeLocal(const Locale('ar', 'SA'));
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      content:
                          const Text('تم تغيير اللغة بنجاح إلى اللغة العربية'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              prov.changeLocal(const Locale('ar', 'SA'));
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DoctorSearchPage()));
                            },
                            child: Text("العودة إلى المنزل"))
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
