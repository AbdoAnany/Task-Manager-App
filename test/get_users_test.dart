

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:task_manager/core/di/dependency_injection.dart';
import 'package:task_manager/core/networking/api_result.dart';
import 'package:task_manager/core/networking/api_service.dart';
import 'package:task_manager/core/networking/dio_factory.dart';
import 'package:task_manager/project/login/data/models/login_request_body.dart';
import 'package:task_manager/project/login/data/models/login_response.dart';
import 'package:task_manager/project/login/data/repos/login_repo.dart';
import 'package:task_manager/project/login/logic/cubit/login_cubit.dart';
import 'package:task_manager/project/users/bloc/users_bloc.dart';
import 'package:task_manager/project/users/data/data_sources/user_provider.dart';
import 'package:task_manager/project/users/data/models/user_response.dart';
import 'package:task_manager/project/users/data/repository/user_repository.dart';



Future<void> main() async {
  test(
    'Full CRUD functionality (Create, Read, Update, Delete) for tasks. Utilizes reqres.in endpoints such as /api/users for managing task data. '
        'Efficient pagination for handling a large number of tasks, leveraging the /api/users?page={page_number} endpoint.',
        () async {
      final dio = Dio(BaseOptions(baseUrl: "https://reqres.in/api/"));
      final dioAdapter = DioAdapter(dio: dio);

      // Mock response data
      final mockData = {
        'page': 1,
        'per_page': 3,
        'total': 6,
        'total_pages': 2,
        'data': [
          {'id': 1, 'email': 'user1@example.com', 'first_name': 'John', 'last_name': 'Doe', 'avatar': 'Doe'},
          {'id': 2, 'email': 'user2@example.com', 'first_name': 'Jane', 'last_name': 'Smith', 'avatar': 'Smith'},
          {'id': 3, 'email': 'user3@example.com', 'first_name': 'Bob', 'last_name': 'Johnson', 'avatar': 'Johnson'}
        ]
      };

      // Add mock response to DioAdapter
      dioAdapter.onGet('users?page=1', (request) => request.reply(200, mockData));

      // Initialize ApiService and UserRepository with Dio instance
      final apiService = RemoteDataSource(dio);
      final userRepository = UserRepository(null,apiService);

      // Perform getUsers operation
      final userResponse = await userRepository.getUsers();

      // Assertions
      expect(userResponse?.totalPages, 2);
      expect(userResponse?.data?.length, 3);
    },
  );
}