import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
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

          CachedNetworkImage(
            imageUrl: image!,   width: 50.w,
            height: 50.w,
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
            errorWidget: (context, url, error) => SizedBox(), // Widget to display if image fails to load
            fit: BoxFit.cover, // Adjust how the image fits within the container
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