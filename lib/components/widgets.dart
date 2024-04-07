import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_palette.dart';

Text buildText(
    String text ,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    TextAlign textAlign,
    TextOverflow overflow


) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: overflow,

    style: TextStyle(
      decoration: TextDecoration.none,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}


class BuildText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool isComplete;
  final TextOverflow overflow;

  const BuildText({super.key,
    this.text = '',
    this.color = Colors.grey,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.isComplete = false,
    this.overflow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        decoration: isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
