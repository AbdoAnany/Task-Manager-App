import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/project/tasks/data/local/model/task_model.dart';
import 'package:task_manager/project/users/data/models/user_model.dart';
import 'package:task_manager/utils/exception_handler.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../utils/constants.dart';
import '../../../../users/bloc/users_bloc.dart';
import '../../../bloc/tasks_bloc.dart';

class TaskDataProvider {
  List<TaskModel> tasks = [];
  SharedPreferences? prefs;

  TaskDataProvider(this.prefs);

  Future<List<TaskModel>> getTasks(UserModel userModel) async {
    try {


      final List<String>? savedTasks = prefs!.getStringList(Constants.taskKey+ userModel.id.toString());
      print(savedTasks);
      if (savedTasks != null) {
        tasks = savedTasks.map((taskJson) => TaskModel.fromJson(json.decode(taskJson))).toList();
        tasks.sort((a, b) {
          if (a.completed == b.completed) {
            return 0;
          } else if (a.completed) {
            return 1;
          } else {
            return -1;
          }
        });
      }else{
        tasks = [];
      }
      return tasks;
    }catch(e){
      throw Exception(handleException(e));
    }
  }
  Future<List<TaskModel>> getAllTasks() async {
    try {


      final List<String>? savedTasks = prefs!.getStringList(Constants.getAllTasks);
      print(savedTasks);
      if (savedTasks != null) {
        tasks = savedTasks.map((taskJson) => TaskModel.fromJson(json.decode(taskJson))).toList();
        tasks.sort((a, b) {
          if (a.completed == b.completed) {
            return 0;
          } else if (a.completed) {
            return 1;
          } else {
            return -1;
          }
        });
      }else{
        tasks = [];
      }
      return tasks;
    }catch(e){
      throw Exception(handleException(e));
    }
  }

  Future<List<TaskModel>> sortTasks(int sortOption) async {
    switch (sortOption) {
      case 0:
        tasks.sort((a, b) {
          // Sort by date
          if (a.startDateTime!.isAfter(b.startDateTime!)) {
            return 1;
          } else if (a.startDateTime!.isBefore(b.startDateTime!)) {
            return -1;
          }
          return 0;
        });
        break;
      case 1:
        //sort by completed tasks
        tasks.sort((a, b) {
          if (!a.completed && b.completed) {
            return 1;
          } else if (a.completed && !b.completed) {
            return -1;
          }
          return 0;
        });
        break;
      case 2:
      //sort by pending tasks
        tasks.sort((a, b) {
          if (a.completed == b.completed) {
            return 0;
          } else if (a.completed) {
            return 1;
          } else {
            return -1;
          }
        });
        break;
    }
    return tasks;
  }

  Future<void> createTask(TaskModel taskModel) async {
    print("getIt<TasksBloc>().userModel.id.toString()");
    print(UsersBloc.userModel!.id.toString());
    try {


      tasks.add(taskModel);
      final List<String> taskJsonList = tasks.map((task) => json.encode(task.toJson())).toList();
      await prefs!.setStringList(Constants.taskKey+  UsersBloc.userModel!.id.toString(), taskJsonList);
    } catch (exception) {
      throw Exception(handleException(exception));
    }
  }

  Future<List<TaskModel>> updateTask(TaskModel taskModel) async {
    try {
      tasks[tasks.indexWhere((element) => element.id == taskModel.id)] =
          taskModel;
      tasks.sort((a, b) {
        if (a.completed == b.completed) {
          return 0;
        } else if (a.completed) {
          return 1;
        } else {
          return -1;
        }
      });
      final List<String> taskJsonList = tasks.map((task) =>
          json.encode(task.toJson())).toList();
      prefs!.setStringList(Constants.taskKey+  UsersBloc.userModel!.id.toString(), taskJsonList);
      return tasks;
    } catch (exception) {
      throw Exception(handleException(exception));
    }
  }

  Future<List<TaskModel>> deleteTask(TaskModel taskModel) async {
    try {
      tasks.remove(taskModel);
      final List<String> taskJsonList = tasks.map((task) =>
          json.encode(task.toJson())).toList();
      prefs!.setStringList(Constants.taskKey+ UsersBloc.userModel!.id.toString(), taskJsonList);
      return tasks;
    } catch (exception) {
      throw Exception(handleException(exception));
    }
  }

  Future<List<TaskModel>> searchTasks(String keywords) async {
    var searchText = keywords.toLowerCase();
    List<TaskModel> matchedTasked = tasks;
    return matchedTasked.where((task) {
      final titleMatches = task.title.toLowerCase().contains(searchText);
      final descriptionMatches = task.description.toLowerCase().contains(searchText);
      return titleMatches || descriptionMatches;
    }).toList();
  }

  Future<UserModel>  selectUser(UserModel userModel) async {
    UsersBloc.userModel = userModel;

 await   prefs!.setString(userModel.id.toString(), json.encode(userModel.toJson()));
    return userModel;
  }
}
