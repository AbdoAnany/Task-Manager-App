import 'package:dio/dio.dart';
import 'package:task_manager/core/networking/api_constants.dart';
import 'package:task_manager/project/login/data/models/login_request_body.dart';
import 'package:task_manager/project/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../project/todos/data/models/todos_response.dart';
import '../../project/users/data/models/todos_response.dart';
import '../../project/users/data/models/user_response.dart';



part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio, {String baseUrl}) = _RemoteDataSource;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );


  @GET(ApiConstants.users)
  Future<UserResponse> getUsers(
      {@Query('limit') int limit = 0, @Query('skip') int skip = 0});

  @GET(ApiConstants.todosId)
  Future<TodosResponse> getTodosId(@Path('id') int? page);
  @GET(ApiConstants.todos)
  Future<TodosResponse> getTodos(
      {@Query('limit') int limit = 10, @Query('skip') int skip = 0});
  @GET(ApiConstants.todosByUserId)
  Future<TodosResponse> getTodosByUserId(
      {@Query('id') int id = 0,});

  // New methods
  @POST(ApiConstants.addTodo) // Assuming this is the endpoint for adding a new todo
  Future<TodosResponse> addTodo(
      @Body() Map<String, dynamic> todoData,
      );
  @PUT(ApiConstants.todosById) // Assuming this is the endpoint for updating a todo
  Future<TodosResponse> updateTodoCompletedStatus(
      @Path('id') int id,
      @Body() Map<String, dynamic> updateData,
      );

  @DELETE(ApiConstants.todosById) // Assuming this is the endpoint for deleting a todo
  Future<TodosResponse> deleteTodo(
      @Path('id') int id,
      );
}
