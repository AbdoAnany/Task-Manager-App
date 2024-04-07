import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/helpers/extensions.dart';
import 'package:task_manager/project/login/logic/cubit/login_cubit.dart';
import 'package:task_manager/project/login/logic/cubit/login_state.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../routes/pages.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                ),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Pages.userScreen);
          },
          error: (error) {
            setupErrorState(context, error??'');
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(

      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorsManager.moreLightGray,
        surfaceTintColor:  ColorsManager.moreLightGray,
        icon:  Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 50.w,
        ),
        content: SizedBox(height: 70.h,
          child: Center(
            child: Text(
              error,
              style: TextStyles.font24BlackBold,
            ),
          ),
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Ok',
                style: TextStyles.font14BlueSemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
