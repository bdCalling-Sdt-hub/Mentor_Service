import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_images/app_images.dart';
import 'package:mentors_service/common/widgets/background_image.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  int activeIndex = 0;
  late final Timer periodicTimer;
  late final Timer navigationTimer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((__){
      loadingPeriodic();
    });
    super.initState();
  }

  loadingPeriodic() {
    periodicTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        activeIndex = (activeIndex + 1) % 6;
      });
    });
    navigationTimer = Timer(const Duration(seconds: 5), () {
      periodicTimer.cancel();
       Get.toNamed(Routes.WELCOME);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImage.appLogoImg,
              height: 343.h,
              width: 395.w,
            ),
            verticalSpacing(50.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: AnimatedContainer(
                      height: 18.h,
                      width: 18.h,
                      duration: const Duration(microseconds: 300),
                      decoration: BoxDecoration(
                          color: index < activeIndex
                              ? AppColors.primaryColor
                              : AppColors.grayLight,
                          shape: BoxShape.circle),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
