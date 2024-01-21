import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper._privateConstructor();

  static final DBHelper instance = DBHelper._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "user.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE users(id INTEGER PRIMARY KEY, nama TEXT, email TEXT, password TEXT)",
    );
  }

  Future<void> addUser(String nama, String email, String password) async {
    final db = await database;
    await db.insert(
      "users",
      {
        "nama": nama,
        "email": email,
        "password": password,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getUser(
      String email, String password) async {
    final db = await database;
    return db.query(
      "users",
      where: "email = ? AND password = ? ",
      whereArgs: [email, password],
    );
  }
}
