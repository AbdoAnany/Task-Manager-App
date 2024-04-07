import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/project/users/data/models/user_model.dart';
import 'package:task_manager/utils/exception_handler.dart';

import '../../../../../utils/constants.dart';

class UserProvider {
  List<UserModel> users = [];
  SharedPreferences? prefs;

  UserProvider(this.prefs);

  Future<List<UserModel>> getUsers() async {
    // var dio = Dio();
    // var response = await dio.request(
    //   'https://reqres.in/api/users?page=1',
    //   options: Options(
    //     method: 'GET',
    //   ),
    // );
    //
    // if (response.statusCode == 200) {
    //   print(json.encode(response.data));
    // }
    // else {
    //   print(response.statusMessage);
    // }
    //
return [];

  }
void aa(){
  // emit(const LoginState.loading());
  // final response = await _loginRepo.login(
  //   LoginRequestBody(
  //     email: emailController.text,
  //     password: passwordController.text,
  //   ),
  // );
  //
  // response.when(success: (loginResponse) {
  //   emit(LoginState.success(loginResponse));
  // }, failure: (error) {
  //   emit(LoginState.error(
  //       error: error.apiErrorModel.message ?? "User not found"));
  // });
}



  Future<List<UserModel>> searchUsers(String keywords) async {
    var searchText = keywords.toLowerCase();
    List<UserModel> matchedTasked = users;
    return matchedTasked.where((task) {
      final titleMatches = task.firstName.toLowerCase().contains(searchText);
      final descriptionMatches = task.lastName.toLowerCase().contains(searchText);
      return titleMatches || descriptionMatches;
    }).toList();
  }
}
