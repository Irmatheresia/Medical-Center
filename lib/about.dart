import 'package:flutter/material.dart';
import 'package:flutter_application_1/firestore/home.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  void _showContactBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Kontak Kami:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text('- Email: thecrew@bookingdokter.com'),
              Text('- Telepon: 123-456-7890'),
            ],
          ),
        );
      },
    );
  }

  void _navigateToHelpPage(BuildContext context) {
    // Navigasi ke halaman bantuan
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyHome(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tentang Aplikasi Booking Dokter',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Aplikasi Booking Dokter adalah sebuah platform yang memudahkan pengguna untuk mencari dan memesan jadwal konsultasi dengan dokter yang tersedia. Dengan aplikasi ini, Anda dapat mencari dokter berdasarkan spesialisasi, melihat jadwal dokter, dan melakukan reservasi konsultasi dengan mudah.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Fitur Aplikasi:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('- Pencarian dokter berdasarkan spesialisasi'),
            const Text('- Melihat jadwal dokter yang tersedia'),
            const Text('- Reservasi konsultasi dengan dokter pilihan'),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () => _showContactBottomSheet(context),
              child: const Text(
                'Kontak Kami:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              child: const Text(
                '- Hati yang gembira adalah obat - ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              _navigateToHelpPage(context);
              print('Tombol Help Ditekan');
            },
            child: Icon(Icons.help_outline_sharp),
          ),
        ),
      ),
    );
  }
}
