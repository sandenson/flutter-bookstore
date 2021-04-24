import 'dart:convert';

class UserModel {
  final String name, email, password;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
    };
  }

  String toJson() => json.encode(toMap());
}
