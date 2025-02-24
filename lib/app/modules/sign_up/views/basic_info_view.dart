import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_text_field.dart';
import 'package:mentors_service/common/widgets/have_an_account_text_button.dart';
import 'package:mentors_service/common/widgets/spacing.dart';
import 'package:mentors_service/common/widgets/text_required.dart';

class BasicInfoView extends StatefulWidget {
  const BasicInfoView({super.key});

  @override
  State<BasicInfoView> createState() => _BasicInfoViewState();
}

class _BasicInfoViewState extends State<BasicInfoView> {
  final SignUpController _signUpController = Get.put(SignUpController());
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTitle(text: AppString.createYourAccountText),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.w),
                  child: Text(
                    AppString.step1BasicInfoText,
                    style: AppStyles.h1(color: AppColors.primaryColor),
                  ),
                ),

                /// First name
                verticalSpacing(10.h),
                TextRequired(
                  text: AppString.firstNameText,
                  textStyle: AppStyles.h4(family: "Schuyler"),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  contentPaddingVertical: 15.h,
                  hintText: "Type your first name",
                  controller: _signUpController.firstNameCtrl,
                ),

                /// Last name
                verticalSpacing(10.h),
                TextRequired(
                  text: AppString.lastNameText,
                  textStyle: AppStyles.h4(family: "Schuyler"),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  contentPaddingVertical: 15.h,
                  hintText: "Type your last name",
                  controller: _signUpController.lastNameCtrl,
                ),

                /// Branch
                SizedBox(height: 15.h),
                TextRequired(
                  text: AppString.branchText,
                  textStyle: AppStyles.h4(family: "Schuyler"),
                ),
                SizedBox(height: 10.h),
                DropdownButtonFormField<String>(
                  value: _signUpController.branch,
                  padding: EdgeInsets.zero,
                  hint: const Text("Select Branch"),
                  items: _signUpController.branchList.map(
                        (gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ),
                      ).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select Branch';
                    }
                    return null;
                  },
                  onChanged: (newValue) {
                    setState(() {
                      _signUpController.branch = newValue;
                      print('Gender>>>${_signUpController.branch}');
                    });
                  },
                ),

                /// Current status
                SizedBox(height: 15.h),
                TextRequired(
                  text: AppString.currentStatusText,
                  textStyle: AppStyles.h4(family: "Schuyler"),
                ),
                SizedBox(height: 15.h),
                DropdownButtonFormField<String>(
                  value: _signUpController.currentStatus,
                  padding: EdgeInsets.zero,
                  hint: const Text("Select current status "),
                  items: _signUpController.currentStatusList
                      .map(
                        (gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select current status';
                    }
                    return null;
                  },
                  onChanged: (newValue) {
                    setState(() {
                      _signUpController.currentStatus = newValue;
                      print('Gender>>>${_signUpController.currentStatus}');
                    });
                  },
                ),

                /// Full name
                verticalSpacing(15.h),
                Text(AppString.instagramOptionalText, style: AppStyles.h4(family: "Schuyler"),),
                SizedBox(height: 10.h),
                CustomTextField(
                  contentPaddingVertical: 15.h,
                  hintText: "Type your username",
                  controller: _signUpController.instagramNameCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),

                /// Action button
                verticalSpacing(30.h),
                CustomButton(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        Get.toNamed(Routes.ROLE_AND_PROFILE);
                      }

                 }, text: 'Next'),

                /// Route Sign-in Screen
                SizedBox(height: 50.h),
                HaveAnAccountTextButton(onTap: () {
                  Get.toNamed(Routes.SIGN_IN);
                },),
                verticalSpacing(40.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

