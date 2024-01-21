import 'package:flutter/material.dart';
import 'package:flutter_application_1/History/detail_screen.dart';
import 'package:flutter_application_1/History/kesehatan_provider.dart';
import 'package:provider/provider.dart';

class HistoryMedisScreen extends StatefulWidget {
  const HistoryMedisScreen({Key? key}) : super(key: key);

  @override
  _HistoryMedisScreenState createState() => _HistoryMedisScreenState();
}

class _HistoryMedisScreenState extends State<HistoryMedisScreen> {
  // @override
  // void initState() {
  //   Future.microtask(() {
  //     Provider.of<KesehatanProvider>(context, listen: false).initialData();
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Medis"),
        actions: [
          menuList(context),
        ],
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    final prov = Provider.of<KesehatanProvider>(context);
    if (prov.data == null) {
      return const Center(
        child: Text('Data tidak ditemukan.'),
      );
    } else {
      return ListView(
        children: List.generate(prov.data['data'].length, (index) {
          var item = prov.data['data'][index];
          return Column(
            children: [
              ListTile(
                leading:
                    CircleAvatar(backgroundImage: NetworkImage(item['img'])),
                title: Text(
                  'Spesialis ${item['spesialis']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreenHistory(
                                id: '',
                              )));
                },
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Diagnosa Pasien: ${item['penyakit']}'),
                    Text('Dokter: ${item['dokter']}'),
                    Text('Tanggal: ${item['tanggal']}'),
                    Text('Metode Pembayaran: ${item['pembayaran']}'),
                  ],
                ),
              ),
              const Divider()
            ],
          );
        }),
      );
    }
  }

  Widget menuList(BuildContext context) {
    final prov = Provider.of<KesehatanProvider>(context);

    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: ((context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: ListTile(
              onTap: () => prov.ubahList('rawatinap'),
              leading: const Icon(Icons.bed),
              title: const Text('Rawat Inap'),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              onTap: () => prov.ubahList('rawatjalan'),
              leading: const Icon(Icons.wheelchair_pickup),
              title: const Text('Rawat Jalan'),
            ),
          ),
        ];
      }),
    );
  }
}
