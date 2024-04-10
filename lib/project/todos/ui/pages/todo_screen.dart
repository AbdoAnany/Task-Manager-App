import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:task_manager/core/di/dependency_injection.dart';
import 'package:task_manager/core/helpers/extensions.dart';
import 'package:task_manager/project/login/logic/cubit/login_cubit.dart';
import 'package:task_manager/project/todos/data/models/todos_response.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../components/build_text_field.dart';
import '../../../../components/custom_app_bar.dart';
import '../../../../components/widgets.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../routes/pages.dart';
import '../../../../utils/font_sizes.dart';
import '../../../../utils/util.dart';
import '../../../tasks/bloc/tasks_bloc.dart';
import '../../../users/bloc/users_bloc.dart';
import '../../bloc/todos_bloc.dart';
import '../../data/data_sources/todos_provider.dart';
import '../widget/TaskManagementPopupMenu.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  void initState() {
    context.read<TodosBloc>().add(FetchTodosEvent(limit: 10, skip: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
      child: SafeArea(
        child: BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
          if (state is TodosLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (state is UpdateTodosFailure) {
            return Center(
              child: buildText(state.error, ColorsManager.black, textMedium,
                  FontWeight.normal, TextAlign.center, TextOverflow.clip),
            );
          }

          if (state is FetchTodosSuccess) {
            return state.todos!.isNotEmpty || state.isSearching ?? false
                ? Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                        child: Row(
                          children: [
                            // Expanded(
                            //   child: BuildTextField(
                            //       hint: "Search recent users",
                            //       //   controller: searchController,
                            //       inputType: TextInputType.text,
                            //       prefixIcon: const Icon(
                            //         Icons.search,
                            //         color: ColorsManager.lightGray,
                            //       ),
                            //       fillColor: ColorsManager.white,
                            //       onChange: (value) {
                            //         if (value.length == 0) {
                            //           context.read<TodosBloc>().add(
                            //               SearchTodosEvent(
                            //                   keywords: value,
                            //                   todoData: context
                            //                       .read<TodosBloc>()
                            //                       .todosList));
                            //         } else {
                            //           context.read<TodosBloc>().add(
                            //               SearchTodosEvent(
                            //                   keywords: value,
                            //                   todoData: context
                            //                       .read<TodosBloc>()
                            //                       .todosList));
                            //         }
                            //       }),
                            // ),
                   Expanded(
                     child: CustomAppBar(
                                title: '${UsersBloc.userModel!.firstName} ${UsersBloc.userModel!.lastName}',
                                image: UsersBloc.userModel!.avatar,
                                showBackArrow: false,
                                actionWidgets: [
                                  InkWell(
                                    onTap: () {
                                      context.pushNamed(Pages.userScreen);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Iconsax.user),
                                    ),
                                  ) ,  InkWell(
                                    onTap: () {
                                      getIt<LoginCubit>().logOut();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Iconsax.logout),
                                    ),
                                  )
                                ],
                              ),
                   ),



                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(18.sp),
                              width: 224.w,
                              height: 120.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: ColorsManager.primaryColor,
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8.sp),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: Colors.grey,
                                                )),
                                            child: Icon(
                                              Iconsax.broom,
                                              color: ColorsManager.primaryColor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Text(
                                            "Activity",
                                            style: TextStyle(
                                              fontSize: 20.w,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    "${state.todos?.where((element) => !element.completed).length}",
                                    style: TextStyle(
                                      fontSize: 24.w,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.all(18.sp),
                            //          width: 224.w,
                            height: 120.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: ColorsManager.primaryColor,
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8.sp),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: Colors.grey,
                                              )),
                                          child: Icon(
                                            Iconsax.task,
                                            color: ColorsManager.primaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text(
                                          "Done",
                                          style: TextStyle(
                                            fontSize: 20.w,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Center(
                                  child: Text(
                                    "${state.todos?.where((element) => element.completed).length}",
                                    style: TextStyle(
                                      fontSize: 24.w,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                          child: ListView.separated(
                        itemCount: state.todos!.length,
                        itemBuilder: (context, index) {
                          TodoData? user = state.todos?[index];

                          return Animate(
                            effects: [
                         //     FadeEffect(duration: Duration(milliseconds: index+300)),
                          //  ScaleEffect(duration: Duration(milliseconds: index+300))
                            ],
                            child:InkWell(
                              onTap: () {
                                // UsersBloc.userModel=user;
                                // context
                                //     .read<TasksBloc>()
                                //     .add(SelectTodoEvent(userModel: user!));
                                print(UsersBloc.userModel!.id);
                                print(UsersBloc.userModel!.firstName);
                                context.pushNamed(Pages.tasksScreen,
                                    arguments: user);
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${user?.id}-  "+"${user?.todo}", //overflow: TextOverflow.ellipsis,

                                        style: TextStyles.font16GraySemiBold
                                            .copyWith(
                                                decoration: user!.completed
                                                    ? TextDecoration.lineThrough
                                                    : null),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0.w),
                                    child: user!.completed
                                        ? Icon(
                                            Icons.done,
                                            color: ColorsManager.done,
                                          )
                                        : Icon(
                                            Icons.access_time,
                                            color: ColorsManager.wait,
                                          ),
                                  ),
                                  TaskManagementPopupMenu(
                                    completed:    user.completed,
                                    onSelected: (ChangeTodosType a) async {
                                      switch (a) {
                                        case ChangeTodosType.add:
                                        // context
                                        //     .read<TodosBloc>()
                                        //     .add(AddTodosEvent(todoData: TodoData()  ));
                                        case ChangeTodosType.update:
                                        state.todos?.firstWhere((element) =>  element.id==user.id).completed=
                                            !user.completed
                                        ;
                                        final re=   await  getIt<TodosLocalDataSource>().getTodosFromPrefs();
                                        state.todos?.firstWhere((element) =>  element.id==user.id).completed=
                                        !user.completed
                                        ;
                                        user.completed=!user.completed;
                                        await  getIt<TodosLocalDataSource>().saveTodosToPrefs(re);
                                        setState(() {

                                        });
                                          // context.read<TodosBloc>().add(
                                          //     UpdateTodosEvent(todoData: user));
                                        case ChangeTodosType.delete:
                                          // context.read<TodosBloc>().add(
                                          //     DeleteTodosEvent(todoData: user));
                                          state.todos?.remove(user);
                                          final re=   await  getIt<TodosLocalDataSource>().getTodosFromPrefs();
                                          re.data?.removeWhere((element) => element.id==user.id);
                                          await  getIt<TodosLocalDataSource>().saveTodosToPrefs(re);
                                          setState(() {

                                          });
                                      }

                                      // TODO: Handle this case.
                                    },
                                  )
                                ],
                              ),
                            ).animate()
                                .fadeIn(duration: 200.ms)
                            //.then(delay: 200.ms) // baseline=800ms
                              .slide()
                          .flip(),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            color: ColorsManager.lightGray,
                          );
                        },
                      )),

                      if(!state.isSearching)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [...    List.generate(
                              state.total! ~/ state.limit!.toInt(),
                                  (index) =>Animate(
                                effects: [FadeEffect(duration: Duration(milliseconds: index+100)), ScaleEffect(duration: Duration(milliseconds: index+300))],
                                child:Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 12.h),
                                  child: InkWell(
                                    onTap: () {
                                      print(state.limit! * index);
                                      context
                                          .read<TodosBloc>()
                                          .add(FetchTodosEvent(
                                        limit: 10,
                                        skip: state.limit! * index,
                                      ));
                                    },
                                    child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: ColorsManager.primaryColor
                                                .withOpacity(.99),
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 22.w,
                                              vertical: 16.h),
                                          child: Text(
                                            (index+1 ).toString(),
                                            style: TextStyles
                                                .font16WhiteSemiBold,
                                          ),
                                        )),
                                  ),
                                ),
                              ))]
                      ,
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/tasks.svg',
                          height: MediaQuery.of(context).size.height * .20,
                          width: MediaQuery.of(context).size.width,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        buildText(
                            'Schedule your tasks',
                            ColorsManager.black,
                            textBold,
                            FontWeight.w600,
                            TextAlign.center,
                            TextOverflow.clip),
                        buildText(
                            'Manage your task schedule easily\nand efficiently',
                            ColorsManager.black.withOpacity(.5),
                            textSmall,
                            FontWeight.normal,
                            TextAlign.center,
                            TextOverflow.clip),
                      ],
                    ),
                  );
          }
          return Container();
        }),
      ),
    ));
  }
}
