import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/background_image.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_card.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

import '../../../../common/app_string/app_string.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const CustomAppBarTitle(
            text: '',
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: CustomCard(
                borderRadius: 24.r,
                padding: 18.sp,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                cardHeight: 400.h,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                      child: Text(AppString.signupText,style: AppStyles.customSize(size: 35),)),
                  verticalSpacing(10.h),
                  Text(AppString.weWillFinishTheSignUpText,style: AppStyles.h3()),
                  verticalSpacing(10.h),
                  Text(AppString.stepSignUpText,style: AppStyles.h3()),
                  verticalSpacing(15.h),
                  CustomButton(onTap: (){
                    Get.toNamed(Routes.BASIC_INFO);
                  }, text: AppString.nextText),
                  verticalSpacing(8.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
