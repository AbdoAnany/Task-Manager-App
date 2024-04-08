import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/components/custom_app_bar.dart';
import 'package:task_manager/components/build_text_field.dart';
import 'package:task_manager/project/users/data/models/user_model.dart';
import 'package:task_manager/utils/color_palette.dart';
import 'package:task_manager/utils/util.dart';

import '../../../../components/widgets.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/theming/colors.dart';
import '../../../../routes/pages.dart';
import '../../../../utils/font_sizes.dart';
import '../../bloc/tasks_bloc.dart';
import '../../data/local/model/task_model.dart';
import '../widget/task_item_view.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<TasksBloc>().add(FetchTaskEvent());


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel arguments ;
    arguments =ModalRoute.of(context)!.settings.arguments  as UserModel;

    var size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: ScaffoldMessenger(
            child: Scaffold(
          backgroundColor:  ColorsManager.white,
          appBar: CustomAppBar(
            title: '${arguments.firstName} ${arguments.lastName}',
            image: arguments.avatar,
            showBackArrow: false,
            actionWidgets: [
              PopupMenuButton<int>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 1,
                onSelected: (value) {
                  switch (value) {
                    case 0:
                      {
                        context.read<TasksBloc>().add(SortTaskEvent(sortOption: 0));
                        break;
                      }
                    case 1:
                      {
                        context.read<TasksBloc>().add(SortTaskEvent(sortOption: 1));
                        break;
                      }
                    case 2:
                      {
                        context.read<TasksBloc>().add(SortTaskEvent(sortOption: 2));
                        break;
                      }
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/calender.svg',
                            width: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          buildText(
                              'Sort by date',
                               ColorsManager.black,
                              textSmall,
                              FontWeight.normal,
                              TextAlign.start,
                              TextOverflow.clip)
                        ],
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/task_checked.svg',
                            width: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          buildText(
                              'Completed tasks',
                               ColorsManager.black,
                              textSmall,
                              FontWeight.normal,
                              TextAlign.start,
                              TextOverflow.clip)
                        ],
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 2,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/task.svg',
                            width: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          buildText(
                              'Pending tasks',
                               ColorsManager.black,
                              textSmall,
                              FontWeight.normal,
                              TextAlign.start,
                              TextOverflow.clip)
                        ],
                      ),
                    ),
                  ];
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset('assets/svgs/filter.svg'),
                ),
              ),
            ],
          ),
          body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: BlocConsumer<TasksBloc, TasksState>(
                      listener: (context, state) {
                    if (state is LoadTaskFailure) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(getSnackBar(state.error,  ColorsManager.red));
                    }

                    if (state is AddTaskFailure || state is UpdateTaskFailure) {
                      context.read<TasksBloc>().add(FetchTaskEvent());
                    }
                  }, builder: (context, state) {
                    if (state is TasksLoading) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }

                    if (state is LoadTaskFailure) {
                      return Center(
                        child: buildText(

                           state.error,
                     ColorsManager.black,
                     textMedium,
                     FontWeight.normal,
                     TextAlign.center,
                 TextOverflow.clip),
                      );
                    }

                    if (state is FetchTasksSuccess) {
                      return state.tasks.isNotEmpty || state.isSearching
                          ? Column(
                              children: [
                                BuildTextField(
                                    hint: "Search recent task",
                                    controller: searchController,
                                    inputType: TextInputType.text,
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: ColorsManager.lightGray,
                                    ),
                                    fillColor:  ColorsManager.white,
                                    onChange: (value) {
                                      context.read<TasksBloc>().add(
                                          SearchTaskEvent(keywords: value));
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                    child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: state.tasks.length,
                                  itemBuilder: (context, index) {
                                    return TaskItemView(
                                        taskModel: state.tasks[index]);
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Divider(
                                      color:  ColorsManager.lightGray,
                                    );
                                  },
                                ))
                              ],
                            )
                          : Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/svgs/tasks.svg',
                                    height: size.height * .20,
                                    width: size.width,
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
                  }))),
          floatingActionButton: FloatingActionButton(
              child: const Icon(
                Icons.add_circle,
                color:  ColorsManager.primaryColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Pages.createNewTask);
              }),
        )));
  }
}
