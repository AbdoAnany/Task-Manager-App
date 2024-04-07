part of 'users_bloc.dart';




@immutable
sealed class UsersEvent {}

class AddNewUserEvent extends UsersEvent {
  final UserModel userModel;

  AddNewUserEvent({required this.userModel});
}

class FetchUserEvent extends UsersEvent {
   int page=1;
  FetchUserEvent({ this.page=1});

}

class SortUserEvent extends UsersEvent {
  final int sortOption;

  SortUserEvent({required this.sortOption});
}

class UpdateUserEvent extends UsersEvent {
  final UserModel userModel;

  UpdateUserEvent({required this.userModel});
}

class DeleteUserEvent extends UsersEvent {
  final UserModel userModel;

  DeleteUserEvent({required this.userModel});
}

class SearchUserEvent extends UsersEvent{
  final String keywords;
  final List<UserModel> userModel;

  SearchUserEvent( {this.userModel=const[],required this.keywords});
}


