import 'dart:convert';

class UserModel {
  late String name;
  late String email;
  late String password;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());

  UserModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }
}
