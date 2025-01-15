import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_images/app_images.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/background_image.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_card.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
     BackgroundImage;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: CustomCard(
              borderRadius: 24.r,
              padding: 18.sp,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              cardHeight: 400.h,
              children: [
                Text(AppString.welcomeText,style: AppStyles.customSize(size: 35),),
                verticalSpacing(10.h),
                Text(AppString.weAreHereForSupportYouText,style: AppStyles.h3()),
                verticalSpacing(15.h),
                CustomButton(onTap: (){
                  Get.toNamed(Routes.SIGN_IN);
                }, text: AppString.signInToContinueText),
                verticalSpacing(8.h),
                CustomButton(onTap: (){
                  Get.toNamed(Routes.SIGN_UP);
                }, text: AppString.signupText),
                verticalSpacing(8.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
