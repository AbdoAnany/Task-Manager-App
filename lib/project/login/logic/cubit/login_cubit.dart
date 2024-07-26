
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/core/di/dependency_injection.dart';
import 'package:task_manager/core/helpers/extensions.dart';
import 'package:task_manager/project/login/data/models/login_request_body.dart';
import 'package:task_manager/project/login/data/repos/login_repo.dart';
import 'package:task_manager/project/login/logic/cubit/login_state.dart';

import '../../../../main.dart';
import '../../../../routes/pages.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController(text: 'eve.holt@reqres.in');
  TextEditingController passwordController = TextEditingController(text: "Aa@12346");
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );


    response.when(success: (loginResponse) {
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
