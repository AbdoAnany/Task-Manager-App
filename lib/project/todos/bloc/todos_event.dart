part of 'todos_bloc.dart';




@immutable
sealed class TodosEvent {}

class AddNewTodosEvent extends TodosEvent {
  final TodoData todoData;

  AddNewTodosEvent({required this.todoData});
}

class FetchTodosEvent extends TodosEvent {
   int skip=0;
   int limit=0;
  FetchTodosEvent({ this.skip=0,this.limit=10});

}

class SortTodosEvent extends TodosEvent {
  final int sortOption;

  SortTodosEvent({required this.sortOption});
}
enum ChangeTodosType{add,update,delete}
class AddTodosEvent extends TodosEvent {
  final TodoData todoData;
  AddTodosEvent({required this.todoData});
}

class UpdateTodosEvent extends TodosEvent {
  final TodoData todoData;
  UpdateTodosEvent({required this.todoData});
}

class DeleteTodosEvent extends TodosEvent {
  final TodoData todoData;
  DeleteTodosEvent({required this.todoData});
}

class SearchTodosEvent extends TodosEvent{
  final String keywords;
  final List<TodoData> todoData;

  SearchTodosEvent( {this.todoData=const[],required this.keywords});
}


