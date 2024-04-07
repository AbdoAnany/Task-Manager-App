// import 'package:task_manager/core/networking/api_error_handler.dart';
// import 'package:task_manager/core/networking/api_result.dart';
// import 'package:task_manager/core/networking/api_service.dart';
// import 'package:task_manager/project/login/data/models/login_request_body.dart';
// import 'package:task_manager/project/login/data/models/login_response.dart';
// import 'package:task_manager/project/users/data/models/user_response.dart';
//
// class UserRepo {
//   final ApiService _apiService;
//
//   UserRepo(this._apiService);
//
//   Future<ApiResult<UserResponse>> getAllUser(UserResponse userResponse ) async {
//     try {
//       final response = await _apiService.getUsers();
//       return ApiResult.success(response);
//     } catch (errro) {
//       return ApiResult.failure(ErrorHandler.handle(errro));
//     }
//   }
// }
