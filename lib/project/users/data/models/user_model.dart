import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class  UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;
  String? token;

  UserModel({
     this.id=0,
     this.email='',
     this.firstName='',
     this.lastName='',
     this.avatar='',
     this.token='',

  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'avatar': avatar,
      'last_name': lastName,
      'token': token,
    };
  }


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      avatar: json['avatar'],
      lastName: json['last_name'],
    );
  }

  @override
  String toString() {
    return 'TaskModel{id: $id, email: $email, first_name: $firstName, '
        'last_name: $lastName, avatar: $avatar}';
  }
  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = user.toJson();
    await prefs.setString('User-${0}', jsonEncode(userData));
  }

// Retrieve user data from cache
  static Future<UserModel?> getUser(id) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('User-${id}');
    if (userData != null) {
      final Map<String, dynamic> json = jsonDecode(userData);
      return UserModel.fromJson(json);
    }
    return null;
  }
}
