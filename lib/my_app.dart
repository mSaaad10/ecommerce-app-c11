import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_ecommerce_app/config/theme/my_theme.dart';
import 'package:route_ecommerce_app/core/utils/routes_manager/routes_manager.dart';
import 'package:route_ecommerce_app/presentation/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>MaterialApp(
        theme:  MyTheme.lightTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routes: {
          RoutesManager.homeRoute : (_)=> HomeScreen(),
        },
        initialRoute: RoutesManager.homeRoute,
      )

    );
  }
}
