
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/core/di/dependency_injection.dart';
import 'package:task_manager/core/helpers/extensions.dart';
import 'package:task_manager/project/login/data/models/login_request_body.dart';
import 'package:task_manager/project/login/data/repos/login_repo.dart';
import 'package:task_manager/project/login/logic/cubit/login_state.dart';
import 'package:task_manager/project/users/data/models/user_model.dart';

import '../../../../main.dart';
import '../../../../routes/pages.dart';
import '../../../users/bloc/users_bloc.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController(text: 'kminchelle');
  TextEditingController passwordController = TextEditingController(text: '0lelplR');
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        username: emailController.text,
        password: passwordController.text,
      ),
    );


    response.when(success: (loginResponse) {
      UsersBloc.userModel=UserModel(id: loginResponse.id!,
        firstName:loginResponse.firstName!  ,lastName:loginResponse.lastName! ,
        email: loginResponse.email! ,avatar: loginResponse.image!,
        token: loginResponse.token
      );
      print( UsersBloc.userModel?.toJson());
      UserModel.saveUser(  UsersBloc.userModel!);
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(
          error: error.apiErrorModel.message ?? "User not found"));
    });
  }

  logOut(){
    getIt<SharedPreferences>().clear();
    Get.context.pushNamedAndRemoveUntil(Pages.loginScreen, predicate: (Route<dynamic> route) =>false);
  }

}
