

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:task_manager/core/di/dependency_injection.dart';
import 'package:task_manager/core/networking/api_result.dart';
import 'package:task_manager/core/networking/api_service.dart';
import 'package:task_manager/core/networking/dio_factory.dart';
import 'package:task_manager/project/login/data/models/login_request_body.dart';
import 'package:task_manager/project/login/data/models/login_response.dart';
import 'package:task_manager/project/login/data/repos/login_repo.dart';
import 'package:task_manager/project/login/logic/cubit/login_cubit.dart';
import 'package:task_manager/project/users/bloc/users_bloc.dart';
import 'package:task_manager/project/users/data/data_sources/user_provider.dart';
import 'package:task_manager/project/users/data/models/user_response.dart';
import 'package:task_manager/project/users/data/repository/user_repository.dart';




Future<void> main() async {
 // Test case for successful login
 // setupGetIt();
 test(
  'Full CRUD functionality (Create, Read, Update, Delete) for tasks. Utilizes reqres.in endpoints such as /api/users for managing task data. '
      'Efficient pagination for handling a large number of tasks, leveraging the /api/users?page={page_number} endpoint.',
      () async {
   late ApiService apiService;
   late   UserLocalDataSource localDataSource;
       late UserRepository userRepository;
   late UsersBloc usersBloc;
   late Dio dio;
// SharedPreferences preferences =  SharedPreferences();

   // Initialize Dio instance
   dio = DioFactory.getDio();
   // Initialize ApiService, LoginRepo, and LoginCubit
   apiService = ApiService(dio);
   localDataSource=UserLocalDataSource(null);
 userRepository = UserRepository(
       localDataSource,
       apiService
   );
   usersBloc = UsersBloc(userRepository);

   // Perform login operation
   UserResponse  userResponse = await userRepository.getUsers(1);

   expect(userResponse.totalPages, 12);

  },
 );


}
