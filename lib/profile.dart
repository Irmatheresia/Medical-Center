import 'package:flutter/material.dart';
import 'package:flutter_application_1/authfirebase.dart';
import 'package:flutter_application_1/jadwal.dart';
import 'package:flutter_application_1/kategori.dart';
import 'package:flutter_application_1/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AuthFirebase auth;

  @override
  void initState() {
    super.initState();
    auth = AuthFirebase();
    auth.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/david.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              "David Bate'e",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 22),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(55, 0, 140, 0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'No. Handphone',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Warna bayangan
                        spreadRadius: 2, // Jarak penyebaran bayangan
                        blurRadius: 5, // Jarak pelebaran bayangan
                        offset: const Offset(
                            0, 3), // Posisi bayangan relatif terhadap container
                      ),
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '08111313234324532',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(55, 0, 140, 0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'NIK ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Warna bayangan
                        spreadRadius: 2, // Jarak penyebaran bayangan
                        blurRadius: 5, // Jarak pelebaran bayangan
                        offset: const Offset(
                            0, 3), // Posisi bayangan relatif terhadap container
                      ),
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '21367835482394612',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(55, 0, 140, 0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Kewarganegaraan',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Warna bayangan
                        spreadRadius: 2, // Jarak penyebaran bayangan
                        blurRadius: 5, // Jarak pelebaran bayangan
                        offset: const Offset(
                            0, 3), // Posisi bayangan relatif terhadap container
                      ),
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jerman',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(55, 0, 140, 0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'E-mail',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Warna bayangan
                        spreadRadius: 2, // Jarak penyebaran bayangan
                        blurRadius: 5, // Jarak pelebaran bayangan
                        offset: const Offset(
                            0, 3), // Posisi bayangan relatif terhadap container
                      ),
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'davidbate@gmail.com',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            Container(
              width: 250,
              height: 50.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Warna bayangan
                    spreadRadius: 2, // Jarak penyebaran bayangan
                    blurRadius: 5, // Jarak pelebaran bayangan
                    offset: const Offset(
                        0, 3), // Posisi bayangan relatif terhadap container
                  ),
                ],
                shape: BoxShape.rectangle,
                color: const Color.fromARGB(
                    255, 236, 217, 6), // Warna latar belakang
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .transparent, // Menghilangkan latar belakang ElevatedButton
                  elevation: 0, // Menghilangkan bayangan
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Mengatur sudut melengkung
                  ),
                ),
                onPressed: () async {
                  await auth.signOut();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('isLoggedIn', false);

                  if (mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: const Color.fromRGBO(
            95, 165, 180, 1), // Warna latar belakang navbar
        child: SizedBox(
          height: 5, // Tinggi navbar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DoctorSearchPage()));
                },
                icon: const Icon(Icons.home),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JadwalDokter()));
                },
                icon: const Icon(Icons.calendar_month),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  // Aksi tombol ketiga
                },
                icon: const Icon(Icons.person),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
