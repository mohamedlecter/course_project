import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  List<Map<String, dynamic>> users = [];
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "userDatabase.db");
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 1);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute(' CREATE TABLE "users"(username TEXT, password TEXT)');
    print("Create Database and TABLES");
  }

  readData(String sql) async {
    Database? mydb = await db;
    users = await mydb!.rawQuery(sql);
    return users;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);

    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
