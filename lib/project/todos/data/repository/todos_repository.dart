
import 'package:task_manager/project/todos/data/models/todos_response.dart';
import 'package:task_manager/project/users/data/models/todos_response.dart';

import '../../../../core/networking/api_service.dart';
import '../data_sources/todos_provider.dart';



class TodosRepository {
  final RemoteDataSource remoteDataSource;
  final TodosLocalDataSource localDataSource;

  TodosRepository(this.remoteDataSource, this.localDataSource);

  Future<TodosResponse> getTodos({int limit = 10, int skip = 0}) async {

    print('getTodos ');
    try {
      // First, try to fetch data from the local data source
      final todosResponse = await localDataSource.getTodosFromPrefs(limit: limit, skip: skip);
      if (todosResponse != null) {
        return todosResponse;
      }
      print('data is not available locally, fetch it from the remote data source');

    } catch (e) {
      // Handle any errors that may occur during local data retrieval
      print('Error fetching todos from local data source: $e');
    }

    // If data is not available locally, fetch it from the remote data source
    try {
      final todosResponse = await remoteDataSource.getTodos(limit: limit, skip: skip);
      // Update the local data source with the fetched data
      await localDataSource.saveTodosToPrefs(todosResponse!,limit: limit, skip: skip);
      return todosResponse;
    } catch (e) {
      // Handle any errors that may occur during remote data retrieval
      print('Error fetching todos from remote data source: $e');
      rethrow; // Re-throwing the error for the calling code to handle
    }
  }

  Future<TodosResponse?> addTodo(TodoData todo,) async {
    try {
       await remoteDataSource.addTodo({
        "todo": todo.todo,
        "completed": todo.completed,
        "userId": todo.userId,
      });
      // Fetch the updated list of todos after adding the new todo
      final updatedTodos = await remoteDataSource.getTodos();

      // Return the updated list of todos
      return updatedTodos;
    } catch (e) {
      print('Error adding todo: $e');
      rethrow;
    }
  }

  Future<TodosResponse?> updateTodoCompletedStatus(int id, bool completed) async {
    try {
      // Make a network call to update the completed status of the todo
      final response = await remoteDataSource.updateTodoCompletedStatus(id, {
        "completed": completed,
      });

      // Fetch the updated list of todos after updating the todo
      final updatedTodos = await remoteDataSource.getTodos();

      // Return the updated list of todos
      return updatedTodos;
    } catch (e) {
      // Handle any errors that may occur during the network call
      print('Error updating todo completed status: $e');
      rethrow; // Re-throwing the error for the calling code to handle
    }
  }

  Future<TodosResponse?> deleteTodo(int id) async {
    try {
      // Make a network call to delete the todo
      final response = await remoteDataSource.deleteTodo(id);

      // Fetch the updated list of todos after deleting the todo
      final updatedTodos = await remoteDataSource.getTodos();

      // Return the updated list of todos
      return updatedTodos;
    } catch (e) {
      // Handle any errors that may occur during the network call
      print('Error deleting todo: $e');
      rethrow; // Re-throwing the error for the calling code to handle
    }
  }

}
