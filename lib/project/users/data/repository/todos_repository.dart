import 'package:nb_utils/nb_utils.dart';
import 'package:task_manager/core/di/dependency_injection.dart';
import 'package:task_manager/project/tasks/data/local/data_sources/tasks_data_provider.dart';
import 'package:task_manager/project/tasks/data/local/model/task_model.dart';
import 'package:task_manager/project/users/data/models/user_model.dart';
import 'package:task_manager/project/users/data/models/user_response.dart';
import 'package:task_manager/project/users/data/models/user_response.dart';

import '../../../../core/networking/api_service.dart';
import '../data_sources/user_provider.dart';



class TodoRepository {
  // final UserLocalDataSource localDataSource;
  // final UserRemoteDataSource remoteDataSource;
  //
  TodoRepository(
    this.localDataSource,
    this.remoteDataSource,
  );
  final RemoteDataSource? remoteDataSource;
  final UserLocalDataSource? localDataSource;

  Future<UserResponse?> getTodos(int id) async {
    // First, try to fetch data from the local data source
    try {
      final userResponse = await localDataSource?.getUsersFromPrefs(limit: 10,skip: 0);
      // Check if data is available in the local data source
      if (userResponse != null) {
        return userResponse;
      }
    } catch (e) {
      // Handle any errors that may occur during local data retrieval
      print('Error fetching users from local data source: $e');
    }

    // If data is not available locally, fetch it from the remote data source
    try {
      final userResponse = await remoteDataSource?.getUsers(limit: 10,skip: 0);
      // Update the local data source with the fetched data
      await localDataSource?.saveUsersToPrefs(userResponse!);
      return userResponse;
    } catch (e) {
      // Handle any errors that may occur during remote data retrieval
      print('Error fetching users from remote data source: $e');
      // Optionally, you can throw an error or return a default response here
      rethrow; // Re-throwing the error for the calling code to handle
    }
  }
}
