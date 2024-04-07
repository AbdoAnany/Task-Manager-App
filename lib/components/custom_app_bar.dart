import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/components/widgets.dart';
import 'package:task_manager/utils/color_palette.dart';
import 'package:task_manager/utils/font_sizes.dart';

import '../core/theming/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? image;
  final Function? onBackTap;
  final bool showBackArrow;
  final Color? backgroundColor;
  final List<Widget>? actionWidgets;

  const CustomAppBar({super.key,
    required this.title,
    this.onBackTap,
    this.showBackArrow = true,
    this.backgroundColor =  ColorsManager.white,
    this.actionWidgets,
    this.image=''
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: showBackArrow ? IconButton(
        icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
        onPressed: () {
          if (onBackTap != null) {
            onBackTap!();
          } else {
            Navigator.of(context).pop();
          }
        },
      ) : null,
      actions: actionWidgets,
      leadingWidth: 40.w,

      title: Row(
        children: [

          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image!)),
              borderRadius: BorderRadius.circular(50),),
          //  margin: EdgeInsets.only(right: 12.w,),
          ),
          SizedBox(width: 12.w,),
          buildText(title,  ColorsManager.black, textXExtraLarge, FontWeight.w500,
              TextAlign.start, TextOverflow.clip),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(56.h);
}