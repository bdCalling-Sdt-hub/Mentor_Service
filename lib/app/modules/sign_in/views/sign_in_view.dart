import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/modules/bottom_menu/bottom_menu..dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/prefs_helper/prefs_helpers.dart';
import 'package:mentors_service/common/widgets/background_image.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_card.dart';
import 'package:mentors_service/common/widgets/custom_text_field.dart';
import 'package:mentors_service/common/widgets/have_an_account_text_button.dart';
import 'package:mentors_service/common/widgets/spacing.dart';
import 'package:mentors_service/main.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final SignInController _loginController = Get.put(SignInController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar:  CustomAppBarTitle(
            text: AppString.loginToTourAccountText,
            backgroundColor: Colors.transparent,
            textColor: Colors.white,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Form(
                  key: _formKey,
                  child: CustomCard(
                    padding: 18.sp,
                    elevation: 3,
                    borderRadius: 24.r,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacing(10.h),
                      Text(AppString.emailText,
                        style: AppStyles.h4(family: "Schuyler"),
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
                        contentPaddingVertical: 20.h,
                        hintText: "Type your email",
                        labelTextStyle:
                            const TextStyle(color: AppColors.primaryColor),
                        controller: _loginController.emailCtrl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                      ),


                      verticalSpacing(20.h),
                      Text(AppString.passawordText,
                        style: AppStyles.h4(family: "Schuyler"),
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
                        hintText: "Type your password",
                        labelTextStyle:
                            const TextStyle(color: AppColors.primaryColor),
                        isObscureText: true,
                        obscure: '*',
                        isPassword: true,
                        controller: _loginController.passCtrl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () async {
                             Get.toNamed(Routes.FORGOT_PASSWORD);
                          },
                          child: Text(
                            "Forgot Password?",
                            style: AppStyles.customSize(
                                size: 14,
                                family: "Schuyler",
                                fontWeight: FontWeight.w500,
                                color: Colors.blueAccent),
                          ),
                        ),
                      ),

                      /// Login Button

                      SizedBox(height: 20.h),
                      Obx(() {
                        return CustomButton(
                            loading: _loginController.isLoading.value,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                await _loginController.login();
                              }
                            },
                            textStyle: AppStyles.h2(color: AppColors.white),
                            text: AppString.loginText);
                      }),

                      /// Route SignUpScreen
                      SizedBox(height: 50.h),
                      HaveAnAccountTextButton(
                        onTap: () {
                          Get.toNamed(Routes.SIGN_UP);
                        },
                        firstText: "Don’t have an account? ",
                        secondText: AppString.signupText,
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
