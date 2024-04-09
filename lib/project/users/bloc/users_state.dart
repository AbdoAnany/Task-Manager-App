part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class FetchUsersSuccess extends UsersState {
  final List<UserModel>? users;
  final bool isSearching;
  final int? page;
  final int? total;
  final int? limit;
  final int? totalPages;
  final int? perPage;

  FetchUsersSuccess( { this.page=1,  this.total=0, this.limit=0,  this.totalPages=0,  this.perPage=0, this.users=const [], this.isSearching = false});
}

final class AddUsersSuccess extends UsersState {}

final class LoadUserFailure extends UsersState {
  final String error;

  LoadUserFailure({required this.error});
}

final class AddUserFailure extends UsersState {
  final String error;

  AddUserFailure({required this.error});
}

final class UsersLoading extends UsersState {}

final class UpdateUserFailure extends UsersState {
  final String error;

  UpdateUserFailure({required this.error});
}

final class UpdateUserSuccess extends UsersState {}
