import 'package:flutter_bookstore/shared/data/user_db.dart';
import 'package:flutter_bookstore/shared/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UsersDao {
  final tableName = 'users';

  Future<List<UserModel>> loadUsers() async {
    UsersDB database = UsersDB();
    Database db = await database.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    List<UserModel> usersList = <UserModel>[];
    for (var json in result) {
      usersList.add(UserModel.fromJson(json));
    }

    return usersList;
  }
}
