

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/core/networking/api_result.dart';
import 'package:task_manager/core/networking/api_service.dart';
import 'package:task_manager/core/networking/dio_factory.dart';
import 'package:task_manager/project/login/data/models/login_request_body.dart';
import 'package:task_manager/project/login/data/models/login_response.dart';
import 'package:task_manager/project/login/data/repos/login_repo.dart';
import 'package:task_manager/project/login/logic/cubit/login_cubit.dart';




Future<void> main() async {
 // Test case for successful login
 test(
  'User Authentication: Success - Secure user login via email and password using the /api/login endpoint from reqres.in.',
      () async {
   late ApiService apiService;
   late LoginRepo loginRepo;
   late LoginCubit loginCubit;
   late Dio dio;

   // Initialize Dio instance
   dio = DioFactory.getDio();
   // Initialize ApiService, LoginRepo, and LoginCubit
   apiService = ApiService(dio);
   loginRepo = LoginRepo(apiService);
   loginCubit = LoginCubit(loginRepo);

   // Perform login operation
   ApiResult<LoginResponse> loginResponse = await loginRepo.login(
    LoginRequestBody(email: 'eve.holt@reqres.in', password: 'password'),
   );

   // Handle success or failure
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

 // Test case for failed login
 test(
  'User Authentication: Failure - Secure user login via email and password using the /api/login endpoint from reqres.in.',
      () async {
   late ApiService apiService;
   late LoginRepo loginRepo;
   late LoginCubit loginCubit;
   late Dio dio;

   // Initialize Dio instance
   dio = DioFactory.getDio();
   // Initialize ApiService, LoginRepo, and LoginCubit
   apiService = ApiService(dio);
   loginRepo = LoginRepo(apiService);
   loginCubit = LoginCubit(loginRepo);

   // Perform login operation with incorrect email
   ApiResult<LoginResponse> loginResponse = await loginRepo.login(
    LoginRequestBody(email: 'eve.holt@reqres.in8', password: 'password'),
   );

   // Handle success or failure
   loginResponse.when(
    success: (e) {
     // Print and assert token
     print('success: ${e.token}');
     expect(e.token, 'QpwL5tke4Pnpja7X4');
    },
    failure: (e) {
     // Print failure reason
     print('failure ${e}');
    },
   );
  },
 );
}
