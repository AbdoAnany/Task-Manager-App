import 'package:flutter/material.dart';

import '../core/theming/colors.dart';
import '../utils/color_palette.dart';
import '../utils/font_sizes.dart';

class BuildTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType inputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final Color fillColor;
  final Color hintColor;
  final int? maxLength;
  final Function onChange;

  const BuildTextField(
      {super.key,
        required this.hint,
        this.controller,
        required this.inputType,
        this.prefixIcon,
        this.suffixIcon,
        this.obscureText = false,
        this.enabled = true,
        this.fillColor =  ColorsManager.white,
        this.hintColor = ColorsManager.lightGray,
        this.maxLength,
        required this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        onChange(value);
      },
      validator: (val) => val!.isEmpty ? 'required' : null,
      keyboardType: inputType,
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: inputType == TextInputType.multiline ? 3 : 1,
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        counterText: "",
        fillColor: fillColor,
        filled: true,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: TextStyle(
          fontSize: textMedium,
          fontWeight: FontWeight.w300,
          color: hintColor,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorStyle: const TextStyle(
          fontSize: textMedium,
          fontWeight: FontWeight.normal,
          color:  ColorsManager.red,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 1, color:  ColorsManager.primaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 0, color: fillColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 0, color: ColorsManager.lightGray),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 0, color: ColorsManager.lightGray)),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color:  ColorsManager.red)),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: ColorsManager.lightGray)),
        focusColor:  ColorsManager.white,
        hoverColor:  ColorsManager.white,
      ),
      cursorColor:  ColorsManager.primaryColor,
      style: const TextStyle(
        fontSize: textMedium,
        fontWeight: FontWeight.normal,
        color:  ColorsManager.black,
      ),
    );
  }
}