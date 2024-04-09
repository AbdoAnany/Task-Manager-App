

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:task_manager/core/di/dependency_injection.dart';
import 'package:task_manager/core/networking/api_constants.dart';
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



