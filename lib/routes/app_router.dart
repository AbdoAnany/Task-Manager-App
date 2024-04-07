import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/project/users/bloc/users_bloc.dart';
import 'package:task_manager/routes/pages.dart';
import 'package:task_manager/splash_screen.dart';


import '../core/di/dependency_injection.dart';
import '../page_not_found.dart';
import '../project/login/logic/cubit/login_cubit.dart';
import '../project/login/ui/login_screen.dart';
import '../project/tasks/ui/pages/tasks_screen.dart';
import '../project/users/ui/pages/user_screen.dart';

Route onGenerateRoute(RouteSettings routeSettings) {

  print("onGenerateRoute >>>>>>>>>>>>>>");
  print(routeSettings.name);
  switch (routeSettings.name) {
    case Pages.initial:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

    case Pages.loginScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),
      );
    case Pages.userScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<UsersBloc>(),
          child: const UserScreen(),
        ),
      );


    case Pages.home:
      return MaterialPageRoute(
        builder: (context) => const TasksScreen(),
        settings: routeSettings
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const PageNotFound(),
      );
  }
}
