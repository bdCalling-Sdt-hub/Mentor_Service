import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_text_field.dart';
import 'package:mentors_service/common/widgets/spacing.dart';
import 'package:mentors_service/common/widgets/text_required.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordController _forgotPasswordController = Get.put(ForgotPasswordController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTitle(text: AppString.forgotPasswordText),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 4,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppString.toEnterYourMailToResetPassText,
                    textAlign: TextAlign.center,
                    style: AppStyles.h4(color: AppColors.gray),
                  ),
                ),
                const Spacer(flex: 1,),
                ///Email
                verticalSpacing(10.h),
                TextRequired(
                  text: AppString.emailText,
                  textStyle: AppStyles.h4(family: "Schuyler"),
                ),
                verticalSpacing(10.h),
                CustomTextField(
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                  controller: _forgotPasswordController.emailCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),

                /// Action button
                verticalSpacing(30.h),
                Obx(() {
                  return CustomButton(
                    loading: _forgotPasswordController.isLoading.value,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await _forgotPasswordController.sendMail(true);
                      }
                    },
                    text: AppString.nextText,
                    // Disable button if loading
                  );
                }),
                const Spacer(flex: 8,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
