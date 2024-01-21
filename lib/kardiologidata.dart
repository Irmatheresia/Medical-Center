import 'dart:async';

class Doctor {
  final String name;
  final double rating;
  final String img;

  Doctor(this.name, this.rating, this.img);
}

class KardiologiDoctorData {
  static final _kardiologiDoctors = [
    Doctor('Dr. Ignazio', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Arabelle', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Aurellia', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Auristela', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Ayudia', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Bridella', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Indira', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Jovanka', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Kailla', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Keysa', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Rosalinda', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Bayu', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Suba', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Frendika', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Jekson', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Bastian', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Andreas', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Theresia', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Putra', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Kurniawan', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Budi', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Adi', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Eko', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Aldo', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Rezky', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Fajar', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Yusuf', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Aditya', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Nugroho', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Abdul', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Gracie', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Fuji', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Jekson', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Jimmy', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Adina', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Sri', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Amelia', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Cindy', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Dita', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Devina', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Erika', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Elsa', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Findy', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Shanika', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Alunan', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Galaxy', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Mars', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Ghania', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Gita', 4.7,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    Doctor('Dr. Hanna', 4.5,
        'https://i.pinimg.com/736x/6c/b9/ed/6cb9ed4c27f7ebe4f5467362fbada110.jpg'),
    // Tambahkan lebih banyak data dokter di sini
  ];

  static Stream<List<Doctor>> fetchKardiologiDoctors() async* {
    int startIndex = 0;
    const int doctorsPerPage = 10;

    while (startIndex < _kardiologiDoctors.length) {
      final endIndex = startIndex + doctorsPerPage;
      yield _kardiologiDoctors.sublist(startIndex, endIndex);

      startIndex = endIndex;
      await Future.delayed(const Duration(seconds: 8));
    }
  }
}
