import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_fetch/res/routes/routes_name.dart';
import '../../res/assets/images.dart';
import '../../res/colors/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.toNamed(RouteName.movieView));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: SizedBox(
                height: Get.height * 0.6,
                width: Get.width * 0.6,
                child: Image.asset(ImageAssets.movie),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Design By : Muhammad Abdullah ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.applicationColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
