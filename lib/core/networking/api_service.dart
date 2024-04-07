import 'package:dio/dio.dart';
import 'package:task_manager/core/networking/api_constants.dart';
import 'package:task_manager/project/login/data/models/login_request_body.dart';
import 'package:task_manager/project/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../project/users/data/models/user_response.dart';



part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  @GET(ApiConstants.users)

  Future<UserResponse> getUsers(@Path('page') int? page);

}
