

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/core/networking/api_result.dart';
import 'package:task_manager/core/networking/api_service.dart';
import 'package:task_manager/core/networking/dio_factory.dart';
import 'package:task_manager/project/login/data/models/login_request_body.dart';
import 'package:task_manager/project/login/data/models/login_response.dart';
import 'package:task_manager/project/login/data/repos/login_repo.dart';
import 'package:task_manager/project/login/logic/cubit/login_cubit.dart';



import 'package:http_mock_adapter/http_mock_adapter.dart';


Future<void> main() async {


 test(
  'User Authentication:Success - Secure user login via email and password using the /api/login endpoint from reqres.in.',
      () async {
   final dio = Dio(); // Create a Dio instance
   final dioAdapter = DioAdapter(dio: dio); // Create a DioAdapter instance

   // Add mock response to DioAdapter for failed login

   // Mock response data
   final mockData = {
    "token": 'QpwL5tke4Pnpja7X4'

   };

   // Add mock response to DioAdapter
   dioAdapter.onGet(   'https://reqres.in/api/login',
       data: {
        'email': 'eve.holt@reqres.in',
        'password': 'password',
       }
       , (request) => request.reply(200, mockData));

   // Initialize ApiService, LoginRepo, and LoginCubit with Dio instance
   final apiService = ApiService(dio);
   final loginRepo = LoginRepo(apiService);

   // Perform login operation
   final ApiResult<LoginResponse> loginResponse = await loginRepo.login(
    LoginRequestBody(email: 'eve.holt@reqres.in', password: 'password'),

   );

   loginResponse.when(
    success: (e) {
     // Print and assert token
     print('success: ${e.token}');
     expect(e.token, 'QpwL5tke4Pnpja7X4');
    },
    failure: (e) {
     print('failure ${e}');
    },
   );
  },
 );
}
