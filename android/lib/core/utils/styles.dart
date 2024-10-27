import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_mang.dart';

class ThemeApp{
  static final ThemeData lightTheme= ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorMang.backgroundLightColor,
      buttonTheme: ButtonThemeData(colorScheme: ColorScheme.dark(primary: ColorMang.buttonColor)),
      appBarTheme: AppBarTheme(backgroundColor: ColorMang.backgroundLightColor),
      textTheme: TextTheme(
        bodyMedium: TextStyles.des,
        bodySmall: TextStyles.buttonText,
        titleMedium: TextStyles.title,
        titleSmall: TextStyles.text,
      )
  );
}
class TextStyles {
  static TextStyle title = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: Colors.white,
  );

  static TextStyle des = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle buttonText = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
  );

  static TextStyle text = TextStyle(
    fontSize: 15.sp,
    color: Colors.grey,
  );
}