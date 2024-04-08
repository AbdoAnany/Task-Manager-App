import 'dart:js_interop';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager/project/login/data/models/login_request_body.dart';
import 'package:task_manager/project/login/data/repos/login_repo.dart';
import 'package:task_manager/project/login/logic/cubit/login_cubit.dart';
import 'package:task_manager/project/login/logic/cubit/login_state.dart';

class MockLoginRepo extends Mock implements LoginRepo {}



void main() {
 late LoginRepo loginRepo;
 late LoginCubit loginCubit;

 setUp(() {
  loginRepo = MockLoginRepo();
  loginCubit = LoginCubit(loginRepo);
 });

 tearDown(() {
  loginCubit.close();
 });

 group('LoginCubit', () {
  test('initial state is LoginState.initial()', () {
   expect(loginCubit.state, equals(const LoginState.initial()));
  });

  blocTest<LoginCubit, LoginState>(
   'emits [LoginState.loading(), LoginState.success()] when login is successful',
   build: () {
    when(loginRepo.login(LoginRequestBody(email:  'eve.holt@reqres.in', password: 'sdgfdgfgd')))
        .thenAnswer((w) async {
      return await w.toJSBox;
    });
    return loginCubit;
   },
   act: (cubit) => cubit.emitLoginStates(),
   expect: () => [
    const LoginState.loading(),
    LoginState.success(loginResponse),
   ],
  );

  // blocTest<LoginCubit, LoginState>(
  //  'emits [LoginState.loading(), LoginState.error()] when login fails',
  //  build: () {
  //   when(loginRepo.login(any))
  //       .thenAnswer((_) async => Failure(ApiErrorModel(message: 'User not found')));
  //   return loginCubit;
  //  },
  //  act: (cubit) => cubit.emitLoginStates(),
  //  expect: () => [
  //   const LoginState.loading(),
  //   LoginState.error(error: 'User not found'),
  //  ],
  // );
 });
}
