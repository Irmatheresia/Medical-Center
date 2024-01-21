import 'package:flutter/material.dart';
import 'package:flutter_application_1/detailkardio.dart';
import 'package:flutter_application_1/helper.dart';
// import 'kardiologidata.dart';

class KardiologiPage extends StatefulWidget {
  const KardiologiPage({super.key});

  @override
  _KardiologiPageState createState() => _KardiologiPageState();
}

class _KardiologiPageState extends State<KardiologiPage> {
  // final Stream<List<Doctor>> _doctorStream =
  //     KardiologiDoctorData.fetchKardiologiDoctors();
  // List<Doctor> _doctors = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _loadDoctors();
  // }

  // void _loadDoctors() async {
  //   await for (final doctors in _doctorStream) {
  //     setState(() {
  //       _doctors.addAll(doctors);
  //     });
  //   }
  // }
  final Stream<List> _doctorStream = HttpHelper().fetchKardiologiDoctors();
  final List _doctors = [];

  @override
  void initState() {
    super.initState();
    _loadDoctors();
  }

  void _loadDoctors() async {
    await for (final doctors in _doctorStream) {
      setState(() {
        _doctors.addAll(doctors);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dokter Spesialis Kardiologi'),
        ),
        body: ListView.builder(
          itemCount: _doctors.length,
          itemBuilder: (context, index) {
            final doctor = _doctors[index];
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailKardio(
                              data: doctor,
                            )));
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(doctor.img),
                // child: Text(doctor.name[
                //     0]), // Display the first character of the doctor's name
              ),
              title: Text(doctor.nama),
              subtitle: Text('Rating: ${doctor.rating.toStringAsFixed(1)}'),
            );
          },
        ));
  }
}
