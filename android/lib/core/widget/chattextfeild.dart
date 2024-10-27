import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_mang.dart';

class Chattextfeild extends StatelessWidget {
  final ValueChanged? onChanged;
  final String hintText;
  final bool isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final FormFieldValidator<String> validator;
  final bool isFilled;
  final String?textInputType;


  Chattextfeild(
      {super.key,
      required this.hintText,
      required this.isObscureText,
      this.suffixIcon,
      this.backgroundColor,
      this.controller,
      required this.validator,
      required this.isFilled,
      this.onChanged,
      this.textInputType
      });

  InputBorder buildInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1),
      borderRadius: BorderRadius.circular(30.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 15.r),
        focusedBorder: buildInputBorder(ColorMang.textFieldColor),
        enabledBorder: buildInputBorder(ColorMang.textFieldColor),
        errorBorder: buildInputBorder(ColorMang.errorColor),
        focusedErrorBorder: buildInputBorder(ColorMang.errorColor),
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: ColorMang.backgroundLightColor),
        suffixIcon: suffixIcon,
        suffixIconColor: ColorMang.backgroundLightColor,
        fillColor: backgroundColor ?? ColorMang.textFieldColor,
        filled: isFilled,
      ),
      obscureText: isObscureText,
      style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: ColorMang.backgroundLightColor),
      validator: validator,
    );
  }
}
