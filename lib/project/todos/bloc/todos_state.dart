part of 'todos_bloc.dart';

@immutable
sealed class TodosState {}

final class FetchTodosSuccess extends TodosState {
  final List<TodoData>? todos;
  final bool isSearching;
  final int? page;
  final int? total;
  final int? limit;
  final int? skip;
  final int? totalPages;
  final int? perPage;

  FetchTodosSuccess( { this.page=1,  this.total=0, this.limit=0, this.skip=0,  this.totalPages=0,  this.perPage=0, this.todos=const [], this.isSearching = false});
}

final class AddTodosSuccess extends TodosState {}

final class LoadUserFailure extends TodosState {
  final String error;

  LoadUserFailure({required this.error});
}

final class AddUserFailure extends TodosState {
  final String error;

  AddUserFailure({required this.error});
}final class UpdateTodosFailure extends TodosState {
  final String error;

  UpdateTodosFailure({required this.error});
}

final class TodosLoading extends TodosState {}

final class LoadTodosFailure extends TodosState {
  final String error;

  LoadTodosFailure({required this.error});
}final class UpdateUserFailure extends TodosState {
  final String error;

  UpdateUserFailure({required this.error});
}

final class UpdateUserSuccess extends TodosState {}
