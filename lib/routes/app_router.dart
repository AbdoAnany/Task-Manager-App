import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/project/todos/bloc/todos_bloc.dart';
import 'package:task_manager/project/users/bloc/users_bloc.dart';
import 'package:task_manager/routes/pages.dart';
import 'package:task_manager/splash_screen.dart';


import '../core/di/dependency_injection.dart';
import '../page_not_found.dart';
import '../project/login/logic/cubit/login_cubit.dart';
import '../project/login/ui/login_screen.dart';
import '../project/tasks/bloc/tasks_bloc.dart';
import '../project/tasks/data/local/model/task_model.dart';
import '../project/tasks/ui/pages/new_task_screen.dart';
import '../project/tasks/ui/pages/tasks_screen.dart';
import '../project/tasks/ui/pages/update_task_screen.dart';
import '../project/todos/ui/pages/todo_screen.dart';
import '../project/users/ui/pages/user_screen.dart';

Route onGenerateRoute(RouteSettings routeSettings) {
  print("onGenerateRoute >>>>>>>>>>>>>>");
  print(routeSettings.name);
  switch (routeSettings.name) {
    case Pages.initial:
      return PageRouteBuilder(
        settings: routeSettings,
        pageBuilder: (_, __, ___) => const SplashScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, -1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );

    case Pages.loginScreen:
      return PageRouteBuilder(
        settings: routeSettings,
        pageBuilder: (_, __, ___) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );
   case Pages.todosScreen:
      return PageRouteBuilder(
        settings: routeSettings,
        pageBuilder: (_, __, ___) => BlocProvider(
          create: (context) => getIt<TodosBloc>(),
          child: const TodosScreen(),
        ),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );

    case Pages.userScreen:
      return PageRouteBuilder(
        settings: routeSettings,
        pageBuilder: (_, __, ___) => BlocProvider(
          create: (context) => getIt<UsersBloc>(),
          child: const UserScreen(),
        ),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );


    case Pages.tasksScreen:
      return PageRouteBuilder(
        settings: routeSettings,
        pageBuilder: (_, __, ___) => BlocProvider(
          create: (context) => getIt<TasksBloc>(),
          child: const TasksScreen(),
        ),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );

    case Pages.createNewTask:
      return PageRouteBuilder(
        settings: routeSettings,
        pageBuilder: (_, __, ___) => BlocProvider(
          create: (context) => getIt<TasksBloc>(),
          child: const NewTaskScreen(),
        ),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );

    case Pages.updateTask:
      return PageRouteBuilder(
        settings: routeSettings,
        pageBuilder: (_, __, ___) => BlocProvider(
          create: (context) => getIt<TasksBloc>(),
          child: UpdateTaskScreen(taskModel: routeSettings.arguments as TaskModel),
        ),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, -1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );

    default:
      return PageRouteBuilder(
        settings: routeSettings,
        pageBuilder: (_, __, ___) => const PageNotFound(),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );
  }
}
