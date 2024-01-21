import 'package:flutter/material.dart';
import 'package:flutter_application_1/about.dart';
import 'package:flutter_application_1/identitas.dart';
import 'package:flutter_application_1/jadwal.dart';
import 'package:flutter_application_1/pengaturan/pengaturan.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/rekammedis.dart';
import 'package:flutter_application_1/Hak%20Akses/contact.dart';
import 'package:localization/localization.dart';
import 'package:permission_handler/permission_handler.dart';
import 'kardiologi.dart';

class DoctorSearchPage extends StatefulWidget {
  const DoctorSearchPage({super.key});

  @override
  _DoctorSearchPageState createState() => _DoctorSearchPageState();
}

class _DoctorSearchPageState extends State<DoctorSearchPage> {
  void contact() async {
    if (await Permission.contacts.status.isGranted) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ContactScreen()));
    } else {
      var status = await Permission.contacts.request();
      print(status);
      if (status == PermissionStatus.granted && mounted) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ContactScreen()));
      } else if (status == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
    }
  }

  void _clearSearchQuery() {
    setState(() {
      searchQuery = '';
    });
  }

  Widget _buildClearButton() {
    return IconButton(
      icon: const Icon(Icons.clear),
      onPressed: _clearSearchQuery,
    );
  }

  List<Doctor> _filteredDoctors() {
    if (searchQuery.isEmpty) {
      return doctors;
    } else {
      return doctors
          .where((doctor) =>
              doctor.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              doctor.specialty
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  final List<Doctor> doctors = [
    Doctor(
        name: 'dr. John Doe Sp. JP',
        specialty: "Button-Kardiologi".i18n(),
        rating: 4.5),
    Doctor(
        name: 'dr. Aran N H S.K.G',
        specialty: "Button-Gigi".i18n(),
        rating: 4.4),
    Doctor(
        name: 'dr. Angel Christy N H Sp.OT',
        specialty: "Button-Orthopedi".i18n(),
        rating: 4.7),
    Doctor(
        name: 'dr. Shani I Sp.PD-KGEH',
        specialty: "Button-Gastroenterologi".i18n(),
        rating: 4.5),
    Doctor(
        name: 'dr. Cio H Sp.N',
        specialty: "Button-Neurolog".i18n(),
        rating: 4.6),
    Doctor(
        name: 'dr. Zean N H Sp.P',
        specialty: "Button-Pulmologi".i18n(),
        rating: 4.5)
    // Add more doctors here
  ];

  String searchQuery = '';

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              padding: const EdgeInsets.only(left: 16.0),
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/david.jpg'),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
                accountName: Text("David Bate'e"),
                accountEmail: Text("davidbate@gmail.com"),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(95, 165, 180, 1),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/david.jpg'),
                )),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text("Menu-Identitas".i18n()),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IdentitasPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: Text("Menu-Riwayat".i18n()),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HistoryMedisScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_emergency),
              title: Text("Menu-Kontak".i18n()),
              onTap: contact,
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text("Menu-Tentang".i18n()),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutUsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text("Menu-Bahasa".i18n()),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Pengaturan()));
              },
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 150, 0),
            child: Text(
              "Title-Pilih-Dokter".i18n(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 280, 0),
            child: Text(
              "Title-Butuhkan".i18n(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "HintText-Cari-Dokter".i18n(),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty ? _buildClearButton() : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Text-Jenis-Spesialis".i18n(),
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KardiologiPage()),
                      );
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const KardiologiPage()),
                        );
                      },
                      child: CategoryCard(
                        icon: Icons.favorite,
                        title: "Button-Kardiologi".i18n(),
                      ),
                    )),
                CategoryCard(
                  icon: Icons.toc_outlined,
                  title: "Button-Gigi".i18n(),
                ),
                CategoryCard(
                  icon: Icons.healing,
                  title: "Button-Orthopedi".i18n(),
                ),
                CategoryCard(
                  icon: Icons.face,
                  title: "Button-Bedah-Plastik".i18n(),
                ),
                CategoryCard(
                  icon: Icons.child_care,
                  title: "Button-Pediatric".i18n(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Text-Dokter".i18n(),
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const JadwalDokter()));
              },
              child: ListView(
                children: [
                  ExpansionPanelList(
                    elevation: 1,
                    expandedHeaderPadding: const EdgeInsets.all(0),
                    expansionCallback: (int panelIndex, bool isExpanded) {
                      setState(() {
                        doctors[panelIndex].isExpanded = !isExpanded;
                      });
                    },
                    children: _filteredDoctors().map((doctor) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(doctor.name),
                            subtitle: Text(doctor.specialty),
                          );
                        },
                        body: DoctorCard(
                          name: doctor.name,
                          specialty: doctor.specialty,
                          rating: doctor.rating,
                        ),
                        isExpanded: doctor.isExpanded,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          )
        ],
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
                  // Aksi tombol pertama
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
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

class Doctor {
  String name;
  String specialty;
  double rating;
  bool isExpanded;

  Doctor({
    required this.name,
    required this.specialty,
    required this.rating,
    this.isExpanded = false,
  });
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Warna bayangan
            spreadRadius: 2, // Jarak penyebaran bayangan
            blurRadius: 5, // Jarak pelebaran bayangan
            offset: const Offset(
                0, 6), // Posisi bayangan relatif terhadap container
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40.0,
            color: Colors.blue,
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;

  const DoctorCard(
      {super.key,
      required this.name,
      required this.specialty,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.0,
            blurRadius: 5.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/doctor_image.jpg'),
            // Ganti dengan path gambar dokter
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  specialty,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle drawer item click for Home
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Jadwal'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JadwalDokter()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          ),
        ],
      ),
    );
  }
}
