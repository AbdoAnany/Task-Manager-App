import 'package:task_manager/project/tasks/data/local/data_sources/tasks_data_provider.dart';
import 'package:task_manager/project/tasks/data/local/model/task_model.dart';
import 'package:task_manager/project/users/data/models/user_model.dart';
import 'package:task_manager/project/users/data/models/user_response.dart';

import '../../../../core/networking/api_service.dart';
import '../data_sources/user_provider.dart';

class UserRepository{
  // final UserProvider userProvider;
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<UserResponse> getUsers(int id) async {
    return await apiService.getUsers( id);
  }

  // Future<void> createNewTask(TaskModel taskModel) async {
  //   return await taskDataProvider.createTask(taskModel);
  // }
  //
  // Future<List<TaskModel>> updateTask(TaskModel taskModel) async {
  //   return await taskDataProvider.updateTask(taskModel);
  // }
  //
  // Future<List<TaskModel>> deleteTask(TaskModel taskModel) async {
  //   return await taskDataProvider.deleteTask(taskModel);
  // }
  //
  // Future<List<TaskModel>> sortTasks(int sortOption) async {
  //   return await taskDataProvider.sortTasks(sortOption);
  // }
  //
  // Future<List<UserModel>> searchTasks(String search) async {
  //  // return await apiService.searchUsers(search);
  // }

}