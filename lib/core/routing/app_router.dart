// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task_manager/core/routing/routes.dart';
// import 'package:task_manager/project/login/logic/cubit/user_cubit.dart';
// import 'package:task_manager/project/login/ui/login_screen.dart';
//
//
// import '../../project/tasks/presentation/pages/tasks_screen.dart';
// import '../di/dependency_injection.dart';
//
// class AppRouter {
//   Route generateRoute(RouteSettings settings) {
//     //this arguments to be passed in any screen like this ( arguments as ClassName )
//     final arguments = settings.arguments;
//
//     switch (settings.name) {
//
//       case Routes.loginScreen:
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (context) => getIt<LoginCubit>(),
//             child: const LoginScreen(),
//           ),a
//         );
//
//
//       case Routes.homeScreen:
//         return MaterialPageRoute(
//           builder: (_) => const TasksScreen(),
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(
//               child: Text('No route defined for ${settings.name}'),
//             ),
//           ),
//         );
//     }
//   }
// }
