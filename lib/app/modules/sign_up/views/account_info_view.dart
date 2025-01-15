import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_outlinebutton.dart';
import 'package:mentors_service/common/widgets/custom_text_field.dart';
import 'package:mentors_service/common/widgets/spacing.dart';
import 'package:mentors_service/common/widgets/text_required.dart';

class AccountInfoView extends StatefulWidget {
  const AccountInfoView({super.key});

  @override
  State<AccountInfoView> createState() => _AccountInfoViewState();
}

class _AccountInfoViewState extends State<AccountInfoView> {
  final SignUpController _signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTitle(text: AppString.createYourAccountText),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.w),
                child: Text(
                  AppString.step3AccountInfoText,
                  style: AppStyles.h1(color: AppColors.primaryColor),
                ),
              ),
              ///Email
              verticalSpacing(10.h),
              TextRequired(text:AppString.emailText,
                textStyle: AppStyles.h4(family: "Schuyler"),
              ),
              verticalSpacing(10.h),
              CustomTextField(
                prefixIcon:  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w),
                  child: const Icon(
                    Icons.mail,
                    color: AppColors.appGreyColor,
                    size: 20,
                  ),
                ),
                filColor: AppColors.textFieldFillColor,
                isEmail: true,
                keyboardType: TextInputType.emailAddress,
                contentPaddingVertical: 20.h,
                hintText: "Type your email",
                labelTextStyle:
                const TextStyle(color: AppColors.primaryColor),
                controller: _signUpController.emailCtrl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your email';
                  }
                  return null;
                },
              ),

              ///Password
              verticalSpacing(20.h),
              TextRequired(text:AppString.passawordText,
                textStyle: AppStyles.h4(family: "Schuyler"),
              ),
              verticalSpacing(10.h),
              CustomTextField(
                filColor: AppColors.textFieldFillColor,
                suffixIconColor: AppColors.appGreyColor,
                prefixIcon: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w),
                  child: SvgPicture.asset(AppIcons.lockIcon),
                ),
                contentPaddingVertical: 20.h,
                hintText: "Type a password",
                labelTextStyle:
                const TextStyle(color: AppColors.primaryColor),
                isObscureText: true,
                obscure: '*',
                isPassword: true,
                controller: _signUpController.passwordCtrl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter password';
                  }
                  return null;
                },
              ),
              ///Confirm-Password
              SizedBox(height: 20.h),
              TextRequired(text:AppString.confirmPasswordText,
                textStyle: AppStyles.h4(family: "Schuyler"),
              ),
              verticalSpacing(10.h),
              CustomTextField(
                filColor: AppColors.textFieldFillColor,
                suffixIconColor: AppColors.appGreyColor,
                prefixIcon: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w),
                  child: SvgPicture.asset(AppIcons.lockIcon),
                ),
                contentPaddingVertical: 20.h,
                hintText: "Re-type your password",
                labelTextStyle:
                const TextStyle(color: AppColors.primaryColor),
                isObscureText: true,
                obscure: '*',
                isPassword: true,
                controller: _signUpController.confirmPasswordCtrl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Re-type your password';
                  }else if(_signUpController.passwordCtrl.text != value){
                    return "Password don't matched";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),

              /// Action button
              verticalSpacing(30.h),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomOutlineButton(
                        onTap: () {
                          Get.back();
                        },
                        text: 'Previous'),
                  ),
                  horizontalSpacing(10.w),
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                        onTap: () {
                          Get.toNamed(Routes.OTP);
                        },
                        text: 'Next'),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
