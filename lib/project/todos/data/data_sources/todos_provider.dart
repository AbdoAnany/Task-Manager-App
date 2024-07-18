import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/project/todos/bloc/todos_bloc.dart';
import 'package:task_manager/project/users/data/models/user_model.dart';
import 'package:task_manager/utils/exception_handler.dart';

import '../../../../../utils/constants.dart';
import '../../../users/bloc/users_bloc.dart';
import '../../../users/data/models/todos_response.dart';
import '../../../users/data/models/user_response.dart';
import '../models/todos_response.dart';

class TodosLocalDataSource {
  List<UserModel> users = [];
  SharedPreferences? prefs;

  TodosLocalDataSource(this.prefs);




  Future<UserResponse?> getUsersFromPrefs({
    int skip=0,
    int limit=10,
  }) async {
    final jsonString = prefs?.getString('user_response-skip$skip-limit${limit}');
    if (jsonString != null) {
      final jsonData = json.decode(jsonString);
      return UserResponse.fromJson(jsonData);
    }
    return null;
  }

  Future<void> saveTodosToPrefs(TodosResponse? todosResponse,{
    int skip=0,
    int limit=10,
  }) async {

    final jsonData = todosResponse?.toJson();
    final jsonString = json.encode(jsonData);
    await prefs?.setString('todos-${UsersBloc.userModel!.id}', jsonString);
  }
  Future<TodosResponse> getTodosFromPrefs() async {
    final jsonString = prefs?.getString('todos-${UsersBloc.userModel!.id}');

    print('getTodosFromPrefs');
    print(jsonString=='null');
    if (jsonString != null&&jsonString!='null') {
      final jsonData = json.decode(jsonString);


      return TodosResponse.fromJson(jsonData);
    }
    return TodosResponse(data: []);
  }

  Future<void> saveUsersToPrefs(UserResponse userResponse,{
    int skip=0,
    int limit=10,
  }) async {
    final jsonData = userResponse.toJson();
    final jsonString = json.encode(jsonData);
    await prefs?.setString('todos-skip$skip-limit${limit}', jsonString);
  }
// return [];

  }




