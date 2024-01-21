import 'package:flutter/material.dart';
import 'package:flutter_application_1/History/kesehatan_provider.dart';
import 'package:provider/provider.dart';

class DetailScreenHistory extends StatefulWidget {
  const DetailScreenHistory({super.key, required this.id});
  final String id;
  @override
  State<DetailScreenHistory> createState() => _DetailScreenHistoryState();
}

class _DetailScreenHistoryState extends State<DetailScreenHistory> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<KesehatanProvider>(context);
    final data =
        prov.rawatinap["data"]?.firstWhere((apa) => apa["id"] == widget.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Diagnosa Pasien: ${data!['penyakit']}'),
          Text('Dokter: ${data['dokter']}'),
          Text('Tanggal: ${data['tanggal']}'),
          Text('Metode Pembayaran: ${data['pembayaran']}'),
        ],
      ),
    );
  }
}
