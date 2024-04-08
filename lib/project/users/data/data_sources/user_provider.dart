import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/project/users/data/models/user_model.dart';
import 'package:task_manager/utils/exception_handler.dart';

import '../../../../../utils/constants.dart';
import '../models/user_response.dart';

class UserLocalDataSource {
  List<UserModel> users = [];
  SharedPreferences prefs;

  UserLocalDataSource(this.prefs);




  Future<UserResponse?> getUsersFromPrefs(page) async {
    final jsonString = prefs.getString('user_response$page');
    if (jsonString != null) {
      final jsonData = json.decode(jsonString);
      return UserResponse.fromJson(jsonData);
    }
    return null;
  }

  Future<void> saveUsersToPrefs(UserResponse userResponse) async {
    final jsonData = userResponse.toJson();
    final jsonString = json.encode(jsonData);
    await prefs.setString('user_response${userResponse.page}', jsonString);
  }
// return [];

  }




