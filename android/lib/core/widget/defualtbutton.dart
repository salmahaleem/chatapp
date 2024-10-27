import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_mang.dart';

class Defualtbutton extends StatelessWidget{
  final String buttonText;
  final Color? color;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  Defualtbutton({
  super.key,
  required this.buttonText,
  this.color,
  required this.onPressed,
  required this.textStyle,
});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: 12.r,
            vertical: 14.r,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0.r),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
        Size(double.maxFinite.w, 50.h)),
        backgroundColor: MaterialStatePropertyAll(
          color ?? ColorMang.buttonColor,
        ),
      ),

      child: Text(
        buttonText,
        style: textStyle,
      ),);
  }

}