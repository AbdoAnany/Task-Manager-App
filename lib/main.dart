import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/project/tasks/bloc/tasks_bloc.dart';
import 'package:task_manager/routes/app_router.dart';
import 'package:task_manager/bloc_state_observer.dart';
import 'package:task_manager/routes/pages.dart';
import 'package:task_manager/project/tasks/data/local/data_sources/tasks_data_provider.dart';
import 'package:task_manager/project/tasks/data/repository/task_repository.dart';
import 'package:task_manager/utils/color_palette.dart';

import 'core/di/dependency_injection.dart';
import 'core/theming/colors.dart';



class Get {
  static  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
  static NavigatorState get navigator => navigatorKey.currentState!;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocStateOberver();
  await setupGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: RepositoryProvider(
          create: (context) => TaskRepository(taskDataProvider: TaskDataProvider(getIt<SharedPreferences>())),
          child: BlocProvider(
              create: (context) => TasksBloc(context.read<TaskRepository>()),
              child: MaterialApp(
                navigatorKey: Get.navigatorKey,

                title: 'Task Manager',
                debugShowCheckedModeBanner: false,
                initialRoute: Pages.initial,
                onGenerateRoute: onGenerateRoute,
                theme: ThemeData(
                  fontFamily: 'Sora',
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  canvasColor: Colors.transparent,
                  colorScheme: ColorScheme.fromSeed(seedColor:  ColorsManager.primaryColor),
                  useMaterial3: true,
                ),
              ))),
    );
  }
}
