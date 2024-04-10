import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/project/todos/data/models/todos_response.dart';

import '../data/repository/todos_repository.dart';



part 'todos_event.dart';

part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosRepository todosRepository;

  TodosBloc(this.todosRepository) : super(FetchTodosSuccess(todos: const [])) {
    on<FetchTodosEvent>(_fetchTodos);
    on<UpdateTodosEvent>(_updateTodos);
    on<DeleteTodosEvent>(_deleteTodos);
    // on<SortTodosEvent>(_sortTodos);
   on<AddTodosEvent>(_addTodos);
   on<SearchTodosEvent>(_searchTodos);
  }

 final List<TodoData> todosList=[];


  void _fetchTodos(FetchTodosEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoading());
    try {
      final user = await todosRepository.getTodos(limit: event.limit,skip: event.skip);
      todosList.clear();
      todosList.addAll(user!.data!.map((e) => TodoData(id: e.id!, todo:e.todo!,
          completed:  e.completed!, userId: e.userId!)).toList());
      return emit(FetchTodosSuccess(
          todos:todosList,
          limit: user.limit,
          skip:user.skip,
        total:user.total,
    //    totalPages:user.totalPages,

      //  perPage:user.perPage,
      ));
    } catch (exception) {
      print("s  ssdfasdfsf exception");
      print(exception);
      emit(LoadTodosFailure(error: exception.toString()));
    }
  }

  _addTodos (AddTodosEvent event, Emitter<TodosState> emit) async {
  // Handle the selected action
    emit(TodosLoading());
    try {
      final user = await todosRepository.addTodo(event.todoData!);

    } catch (exception) {
      print("s  ssdfasdfsf exception");
      print(exception);
      emit(LoadTodosFailure(error: exception.toString()));
    }
  }


  _updateTodos(UpdateTodosEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoading());
    try {
      print('_updateTodos');


      final todos = await todosRepository.updateTodoCompletedStatus(event.todoData.id!,event.todoData.completed);
      // emit(UpdateTodosSuccess());
      print(todos?.data?.length);
      return emit(FetchTodosSuccess(todos: todos?.data,total: 150));
    } catch (exception) {
      emit(UpdateTodosFailure(error: exception.toString()));
    }
  }

  _deleteTodos(DeleteTodosEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoading());
    try {
      print('_updateTodos');

      final todos = await todosRepository.deleteTodo(event.todoData.id!);
      print(todos?.data?.length);
      print(todos?.toJson());
      return emit(FetchTodosSuccess(todos: todos?.data,total: todos?.total,limit: todos?.limit));
    } catch (exception) {
      emit(LoadTodosFailure(error: exception.toString()));
    }
  }

  // _sortTodos(SortTodosEvent event, Emitter<TodosState> emit) async {
  //   final Todos = await TodosRepository.sortTodos(event.sortOption);
  //   return emit(FetchTodosSuccess(users: Todos));
  // }
  //
  _searchTodos(SearchTodosEvent event, Emitter<TodosState> emit) async {


    final todos =    todosList.where((element) =>
    element.todo!.toLowerCase() .contains(event.keywords )).toList();
    return emit(FetchTodosSuccess( isSearching: true, todos: todos));
  }


}
