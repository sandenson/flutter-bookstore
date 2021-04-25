import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UsersDB {
  late Database _db;

  Future<Database> get db async {
    _db = await _initDB();
    return _db;
  }

  _initDB() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'books.db');
    print(path);

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE users (id INTEGER PRIMARY KEY, nome varchar(100) NOT NULL, email varchar(100) NOT NULL, senha varchar(10) NOT NULL);';
    await db.execute(sql);

    sql =
        "INSERT INTO users (id, nome, email, senha) VALUES (1, 'Jorge', 'jorge@gmail.com', '123456');";
    await db.execute(sql);
  }
}
