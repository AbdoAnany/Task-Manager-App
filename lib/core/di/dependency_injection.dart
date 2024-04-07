import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/core/networking/api_service.dart';
import 'package:task_manager/core/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';

import '../../project/login/data/repos/login_repo.dart';
import '../../project/login/logic/cubit/login_cubit.dart';
import '../../project/users/bloc/users_bloc.dart';
import '../../project/users/data/repository/user_repository.dart';
// import '../../../project/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Caching
  SharedPreferences preferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() =>preferences);

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // user
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(apiService: getIt()));
  getIt.registerFactory<UsersBloc>(() => UsersBloc(getIt()));


}
