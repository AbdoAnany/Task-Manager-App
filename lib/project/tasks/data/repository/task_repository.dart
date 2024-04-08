import 'package:task_manager/project/tasks/data/local/data_sources/tasks_data_provider.dart';
import 'package:task_manager/project/tasks/data/local/model/task_model.dart';
import 'package:task_manager/project/users/data/models/user_model.dart';

class TaskRepository{
  final TaskDataProvider taskDataProvider;

  TaskRepository({required this.taskDataProvider});

  Future<List<TaskModel>> getTasks(UserModel userModel) async {
    return await taskDataProvider.getTasks(userModel);
  }

  Future<void> createNewTask(TaskModel taskModel) async {
    return await taskDataProvider.createTask(taskModel);
  }

  Future<List<TaskModel>> updateTask(TaskModel taskModel) async {
    return await taskDataProvider.updateTask(taskModel);
  }

  Future<List<TaskModel>> deleteTask(TaskModel taskModel) async {
    return await taskDataProvider.deleteTask(taskModel);
  }

  Future<List<TaskModel>> sortTasks(int sortOption) async {
    return await taskDataProvider.sortTasks(sortOption);
  }

  Future<List<TaskModel>> searchTasks(String search) async {
    return await taskDataProvider.searchTasks(search);
  }

  Future<UserModel>  selectUser(UserModel userModel) async {
    return await taskDataProvider.selectUser(userModel);
  }

}