import 'package:flutter/material.dart';

class IdentitasPage extends StatefulWidget {
  const IdentitasPage({Key? key}) : super(key: key);

  @override
  State<IdentitasPage> createState() => _IdentitasPageState();
}

class _IdentitasPageState extends State<IdentitasPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _placeOfBirthController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _healthHistoryController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateOfBirthController.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identitas Diri'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
              ),
            ),
            TextField(
              controller: _placeOfBirthController,
              decoration: const InputDecoration(
                labelText: 'Tempat Lahir',
              ),
            ),
            GestureDetector(
              onTap: () {
                _selectDate(context);
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: _dateOfBirthController,
                  decoration: const InputDecoration(
                    labelText: 'Tanggal Lahir',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ),
            TextField(
              controller: _nikController,
              decoration: const InputDecoration(
                labelText: 'NIK',
              ),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
              ),
            ),
            TextField(
              controller: _healthHistoryController,
              decoration: const InputDecoration(
                labelText: 'Riwayat Kesehatan',
              ),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'No. Telepon',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Simpan data atau lakukan tindakan lain
                // Berdasarkan nilai yang diisi pada TextField

                // Tampilkan Snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Data berhasil disimpan.'),
                  ),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
