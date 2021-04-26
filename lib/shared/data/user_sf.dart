import 'dart:convert';

import 'package:flutter_bookstore/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSF {
  Future<String> getValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String userModelJson =
        prefs.getString('user') != null ? prefs.getString('user')! : "a";

    final userAsList = jsonDecode(userModelJson) as List;

    final user = userAsList.map((e) => UserModel.fromMap(e)).toList();

    return user[0].name;
  }
}
