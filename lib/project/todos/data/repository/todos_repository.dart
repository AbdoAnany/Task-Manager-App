
import 'package:task_manager/project/todos/data/models/todos_response.dart';
import 'package:task_manager/project/users/data/models/todos_response.dart';

import '../../../../core/networking/api_service.dart';
import '../data_sources/todos_provider.dart';



class TodosRepository {
  final RemoteDataSource remoteDataSource;
  final TodosLocalDataSource localDataSource;

  TodosRepository(this.remoteDataSource, this.localDataSource);

  Future<TodosResponse> getTodos({ int limit=10,  int skip=0}) async {
    try {
      // First, try to fetch data from the local data source
      final todosResponse = await localDataSource.getTodosFromPrefs();
print( 'todosResponse.data!.any((element) =>element.id!>skip& ${skip} and ${skip+limit}');

print( todosResponse.data!.any((element) =>element.id!>skip&&
    element.id!<=skip+limit));
print(todosResponse.toJson());
      if (

          todosResponse.data!.any((element) =>element.id!>skip&&
              element.id!<=skip+limit)


      ) {
        todosResponse.data=     todosResponse.data?.where((element) =>
        element.id!>skip&&
        element.id!<=skip+limit
        ).toList();
        return todosResponse;
      }

      print('Data is not available locally, fetching from remote data source');
    } catch (e) {
      print('Error fetching todos from local data source: $e');
    }

    // If data is not available locally or incomplete, fetch it from the remote data source
    try {
      final TodosResponse remoteTodosResponse = await remoteDataSource.getTodos(limit:limit,skip:skip  );

      // Merge remote todos with existing local todos
      final TodosResponse localTodosResponse = await localDataSource.getTodosFromPrefs();


        final uniqueRemoteTodos = remoteTodosResponse.data!
            .where((remoteTodo) =>
        !localTodosResponse.data!.any((localTodo) => localTodo.id == remoteTodo.id))
            .toList();

      // Merge unique remote todos with existing local todos
      localTodosResponse.data!.addAll(uniqueRemoteTodos);
      localTodosResponse.total = remoteTodosResponse.total;

      // Save merged todos to local storage
      await localDataSource.saveTodosToPrefs(localTodosResponse);

      print('Todos fetched remotely and saved locally ${localTodosResponse.data?.length}');

      return remoteTodosResponse;
    } catch (e) {
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
    final re=   await  localDataSource.getTodosFromPrefs();
      re.data?.removeWhere((element) => element.id==id);
      await  localDataSource.saveTodosToPrefs(re);
   //   final response = await localDataSource.saveTodosToPrefs(id);
      updatedTodos.data?.removeWhere((element) => element.id==id);
      // Return the updated list of todos
      return updatedTodos;
    } catch (e) {
      // Handle any errors that may occur during the network call
      print('Error deleting todo: $e');
      rethrow; // Re-throwing the error for the calling code to handle
    }
  }

}
