import 'package:flutter/material.dart';
import 'package:flutter_application_1/kategori.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:table_calendar/table_calendar.dart';

class JadwalDokter extends StatefulWidget {
  const JadwalDokter({Key? key}) : super(key: key);

  @override
  State<JadwalDokter> createState() => _JadwalDokterState();
}

class _JadwalDokterState extends State<JadwalDokter> {
  DateTime today = DateTime.now();
  bool isButtonClicked = false;
  bool isButtonActive = true;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      isButtonClicked = false;
      isButtonActive = true; // Reset status tombol saat tanggal berubah
    });
  }

  void _onButtonClicked() {
    setState(() {
      isButtonClicked = true;
      isButtonActive =
          false; // Mengubah status tombol menjadi tidak aktif setelah diklik
    });
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Antrean Berhasil Dibuat'),
          content: const Text('Selamat! Anda telah berhasil mengambil antrean.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
      body: content(),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: const Color.fromRGBO(95, 165, 180, 1), // Warna latar belakang navbar
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
                onPressed: () {},
                icon: const Icon(Icons.calendar_month),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()));
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

  Widget content() {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(left: 23),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://palopopos.fajar.co.id/wp-content/uploads/2022/05/seksolog-kondang-dr-boyke-dian-nugraha-spog-mars-foto-tangk-99.jpg'),
                  // Ganti dengan path gambar dokter
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr. John Doe",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 4.0),
                      Text(
                        ("Kardiologi"),
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        Container(
            margin: const EdgeInsets.only(right: 230),
            child: const Text(
              "Pilih jam kedatangan",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          width: 450,
          height: 265,
          child: TableCalendar(
            locale: "en_US",
            rowHeight: 30,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2018, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            onDaySelected: _onDaySelected,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 25, right: 340),
              child: const Text(
                'Pagi',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: isButtonActive
                      ? () {
                          setState(() {
                            _onDaySelected(today, today);
                            _onButtonClicked();
                          });
                        }
                      : null,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isButtonClicked ? Colors.blue : Colors.white,
                  ),
                  child: const Text('08:00'),
                ),
                const SizedBox(width: 5.0),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Handle button 2 press
                    });
                  },
                  child: const Text('10:00'),
                ),
                const SizedBox(width: 10.0),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Handle button 3 press
                    });
                  },
                  child: const Text('11:00'),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, right: 320),
              child: const Text(
                'Siang',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Handle button 1 press
                    });
                  },
                  child: const Text('13:00'),
                ),
                const SizedBox(width: 16.0),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Handle button 2 press
                    });
                  },
                  child: const Text('15:00'),
                ),
                const SizedBox(width: 16.0),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Handle button 3 press
                    });
                  },
                  child: const Text('16:00'),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, right: 320),
              child: const Text(
                'Malam',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Handle button 1 press
                    });
                  },
                  child: const Text('19:00'),
                ),
                const SizedBox(width: 16.0),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Handle button 2 press
                    });
                  },
                  child: const Text('20:00'),
                ),
                const SizedBox(width: 16.0),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Handle button 3 press
                    });
                  },
                  child: const Text('21:00'),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        Container(
          width: 400,
          height: 50.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Warna bayangan
                spreadRadius: 2, // Jarak penyebaran bayangan
                blurRadius: 5, // Jarak pelebaran bayangan
                offset:
                    const Offset(0, 3), // Posisi bayangan relatif terhadap container
              ),
            ],
            shape: BoxShape.rectangle,
            color: const Color.fromRGBO(95, 165, 180, 1), // Warna latar belakang
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              // Show the "Antrean berhasil dibuat" dialog
              _showSuccessDialog(context);
            },
            child: const Text(
              'Ambil Antrean',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
