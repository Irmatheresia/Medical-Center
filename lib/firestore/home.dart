import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firestore/event_model.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<EventModel> details = [];
  @override
  void initState() {
    readData();
    super.initState();
  }

  Future readData() async {
    FirebaseFirestore db = await FirebaseFirestore.instance;
    var data = await db.collection('help_id').get();
    setState(() {
      details =
          data.docs.map((doc) => EventModel.fromDocSnapshot(doc)).toList();
    });
  }

  String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (index) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  deleteAt(String documentId) async {
    FirebaseFirestore db = await FirebaseFirestore.instance;
    await db.collection('help_id').doc(documentId).delete();
    setState(() {
      details.removeWhere((detail) => detail.id == documentId);
    });
  }

  deleteAll() async {
    FirebaseFirestore db = await FirebaseFirestore.instance;
    db.collection('help_id').get().then((snap) {
      for (DocumentSnapshot ds in snap.docs) {
        ds.reference.delete();
      }
    });
    setState(() {
      details.clear();
    });
  }

  Future<void> _showSnackbar(String message) async {
    await Future.delayed(
        const Duration(milliseconds: 300)); // Delay for a smoother transition
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  customAdd(nama, email, perihal, detail) async {
    FirebaseFirestore db = await FirebaseFirestore.instance;
    EventModel InsertData =
        EventModel(nama: nama, email: email, perihal: perihal, detail: detail);
    await db.collection('help_id').add(InsertData.toMap());
    readData();

    setState(() {
      details.add(InsertData);
    });
    _showSnackbar('Seseorang Akan Menghubungi Kamu!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pusat Bantuan"),
        actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            icon: const Icon(Icons.delete_forever),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    TextEditingController nama = TextEditingController();
                    TextEditingController email = TextEditingController();
                    TextEditingController perihal = TextEditingController();
                    TextEditingController detail = TextEditingController();
                    return AlertDialog(
                      title: Text(
                        "Jam Operasional : Hari Senin - Jumat, pukul 09.00-18.00 WIB",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: nama,
                            decoration: InputDecoration(
                              labelText: 'Nama',
                              hintText: 'Masukkan Nama',
                            ),
                          ),
                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Masukkan Email',
                            ),
                          ),
                          TextField(
                            controller: perihal,
                            decoration: InputDecoration(
                              labelText: 'Perihal',
                              hintText: 'Masukkan Perihal',
                            ),
                          ),
                          TextField(
                            controller: detail,
                            decoration: InputDecoration(
                              labelText: 'Detail',
                              hintText: 'Masukkan Detail',
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            customAdd(
                              nama.text,
                              email.text,
                              perihal.text,
                              detail.text,
                            );
                            Navigator.pop(context);
                          },
                          child: const Text('Kirim'),
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: details.length,
          itemBuilder: ((context, index) {
            return Card(
              color: Colors.white70,
              child: ListTile(
                title: Text(details[index].nama),
                subtitle: Text(
                    '${details[index].email} \nPerihal: ${details[index].perihal}\nDetail: ${details[index].detail}'),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.remove_circle,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    deleteAt(details[index].id!);
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
