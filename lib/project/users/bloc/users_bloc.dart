import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/user_model.dart';
import '../data/repository/user_repository.dart';



part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository usersRepository;

  UsersBloc(this.usersRepository) : super(FetchUsersSuccess(users: const [])) {
    on<FetchUserEvent>(_fetchUsers);
    // on<UpdateUserEvent>(_updateUsers);
    // on<DeleteUserEvent>(_deleteUsers);
    // on<SortUserEvent>(_sortUsers);
   on<SearchUserEvent>(_searchUsers);
  }

 final List<UserModel> usersList=[];

  static UserModel? userModel=UserModel(id: 0, email: '', firstName: 'dsdsad', lastName: '', avatar: '');

  void _fetchUsers(FetchUserEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    try {
      final user = await usersRepository.getUsers(limit: event.limit,skip: event.skip);
      usersList.clear();
      usersList.addAll(user!.data!.map((e) => UserModel(id: e.id!, email: e.email!,
          firstName: e.firstName!, lastName: e.lastName!, avatar: e.avatar!)).toList());
      return emit(FetchUsersSuccess(
          users: usersList,
          limit: user.limit,

          page:user.page,
        total:user.total,
    //    totalPages:user.totalPages,

      //  perPage:user.perPage,
      ));
    } catch (exception) {
      print("s  ssdfasdfsf exception");
      print(exception);
      emit(LoadUserFailure(error: exception.toString()));
    }
  }



  // _updateUsers(UpdateUserEvent event, Emitter<UsersState> emit) async {
  //   try {
  //     if (event.userModel.firstName.trim().isEmpty) {
  //       return emit(UpdateUserFailure(error: 'Users title cannot be blank'));
  //     }
  //     if (event.UsersModel.description.trim().isEmpty) {
  //       return emit(
  //           UpdateUsersFailure(error: 'Users description cannot be blank'));
  //     }
  //     if (event.UsersModel.startDateTime == null) {
  //       return emit(UpdateUsersFailure(error: 'Missing Users start date'));
  //     }
  //     if (event.UsersModel.stopDateTime == null) {
  //       return emit(UpdateUsersFailure(error: 'Missing Users stop date'));
  //     }
  //     emit(UsersLoading());
  //     final Users = await UsersRepository.updateUsers(event.UsersModel);
  //     emit(UpdateUsersuccess());
  //     return emit(FetchUsersSuccess(Users: Users));
  //   } catch (exception) {
  //     emit(UpdateUsersFailure(error: exception.toString()));
  //   }
  // }
  //
  // _deleteUsers(DeleteUsersEvent event, Emitter<UsersState> emit) async {
  //   emit(UsersLoading());
  //   try {
  //     final Users = await UsersRepository.deleteUsers(event.UsersModel);
  //     return emit(FetchUsersSuccess(Users: Users));
  //   } catch (exception) {
  //     emit(LoadUsersFailure(error: exception.toString()));
  //   }
  // }

  // _sortUsers(SortUserEvent event, Emitter<UsersState> emit) async {
  //   final Users = await UsersRepository.sortUsers(event.sortOption);
  //   return emit(FetchUsersSuccess(users: Users));
  // }
  //
  _searchUsers(SearchUserEvent event, Emitter<UsersState> emit) async {


    final users =    usersList.where((element) =>
    element.firstName!.toLowerCase() .contains(event.keywords )||
        element.lastName!.toLowerCase().contains(event.keywords)).toList() ;
    return emit(FetchUsersSuccess( isSearching: true, users: users));
  }
}
