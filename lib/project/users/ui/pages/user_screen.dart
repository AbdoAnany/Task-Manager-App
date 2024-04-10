import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_manager/core/di/dependency_injection.dart';
import 'package:task_manager/core/helpers/extensions.dart';
import 'package:task_manager/project/login/logic/cubit/login_cubit.dart';

import '../../../../components/build_text_field.dart';
import '../../../../components/custom_app_bar.dart';
import '../../../../components/widgets.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../routes/pages.dart';
import '../../../../utils/font_sizes.dart';
import '../../../../utils/util.dart';
import '../../../tasks/bloc/tasks_bloc.dart';
import '../../bloc/users_bloc.dart';
import '../../data/models/user_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    context.read<UsersBloc>().add(FetchUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: null,toolbarHeight: 0,
      ),
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
      child: SafeArea(
        child: BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
          if (state is UsersLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (state is UpdateUserFailure) {
            return Center(
              child: buildText(state.error, ColorsManager.black, textMedium,
                  FontWeight.normal, TextAlign.center, TextOverflow.clip),
            );
          }

          if (state is FetchUsersSuccess) {
            return state.users!.isNotEmpty || state.isSearching??false
                ? Column(
                    children: [
                      // SizedBox(height: 50.h,
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: BuildTextField(
                      //             hint: "Search recent users",
                      //             //   controller: searchController,
                      //             inputType: TextInputType.text,
                      //             prefixIcon: const Icon(
                      //               Icons.search,
                      //               color: ColorsManager.lightGray,
                      //             ),
                      //             fillColor: ColorsManager.white,
                      //             onChange: (value) {
                      //               if (value.length == 0) {
                      //                 context.read<UsersBloc>().add(SearchUserEvent(
                      //                     keywords: value,
                      //                     userModel:
                      //                     context.read<UsersBloc>().usersList));
                      //               } else {
                      //                 context.read<UsersBloc>().add(SearchUserEvent(
                      //                     keywords: value,
                      //                     userModel:
                      //                     context.read<UsersBloc>().usersList));
                      //               }
                      //             }),
                      //       ),
                      //       InkWell(onTap: (){
                      //         getIt<LoginCubit>().logOut();
                      //       },
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Icon(Iconsax.logout),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),

                      SizedBox(height: 60.h,
                        child: CustomAppBar(
                          title: '${UsersBloc.userModel!.firstName} ${UsersBloc.userModel!.lastName}',
                          image: UsersBloc.userModel!.avatar,
                          showBackArrow: false,onBackTap:null ,
                          actionWidgets: [
                        InkWell(
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

                      Expanded(
                          child: ListView.separated(
                        itemCount: state.users!.length,
                        itemBuilder: (context, index) {
                          UserModel? user = state.users?[index];


                          return InkWell(
                            onTap: () {
                              // UsersBloc.userModel=user;
                              context
                                  .read<TasksBloc>()
                                  .add(SelectUserEvent(userModel: user!));
                              print(UsersBloc.userModel!.id);
                              print(UsersBloc.userModel!.firstName);
                              context.pushNamed(Pages.tasksScreen,
                                  arguments: user);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 75.w,
                                  height: 75.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                  child: CachedNetworkImage(
                                    imageUrl: user?.avatar??'',   width: 75.w,
                                    height: 75.w,
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                            
                                            // colorFilter:
                                            // ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Padding(
                                      padding:  EdgeInsets.all(20.0.h),
                                      child: CircularProgressIndicator(),
                                    ), // Placeholder widget while loading
                                    errorWidget: (context, url, error) => Icon(Icons.error), // Widget to display if image fails to load
                                    fit: BoxFit.cover, // Adjust how the image fits within the container
                                  ),
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${user?.firstName}",
                                      style: TextStyles.font16DarkBlueMedium,
                                    ),
                                    Text(   "${user?.lastName}",

                                      style: TextStyles.font16DarkBlueMedium,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      "${user?.email}",

                                      style: TextStyles.font14GrayRegular,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            color: ColorsManager.lightGray,
                          );
                        },
                      )),
                      SingleChildScrollView(scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              (state.total! ~/ state.limit!),
                              (index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        if (state.page != index + 1) {
                                          context.read<UsersBloc>().add(
                                              FetchUserEvent(
                                                limit: 10,skip:(index + 1) ,
                                                 )
                                          );
                                        }
                                      },
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: ColorsManager.primaryColor
                                                  .withOpacity(.99),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w, vertical: 16.h),
                                            child: Text(
                                              (index + 1).toString(),
                                              style:
                                                  TextStyles.font16WhiteSemiBold,
                                            ),
                                          )),
                                    ),
                                  )),
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
