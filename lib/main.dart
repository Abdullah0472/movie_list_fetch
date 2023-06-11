import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_list_fetch/res/colors/colors.dart';
import 'package:movie_list_fetch/res/routes/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'view/splash/splash_view.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColor.applicationColor));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) =>
          ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 480, name: MOBILE),
              const Breakpoint(start: 481, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
      defaultTransition: Transition.native,
      // Enable native transitions
      popGesture: true,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.whiteColor,
      ),
      home: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: const SplashView(),
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }}