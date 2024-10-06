import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_ecommerce_app/core/utils/colors_manager/colors_manager.dart';

class MyTheme{
  static final ThemeData lightTheme =ThemeData(
    primaryColor: ColorsManager.darkBlue,
    textTheme:  TextTheme(
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.darkBlue,
      ),
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.darkBlue,
      ),
      labelSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.darkBlue,
      ),

    ),

  );
}