import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:mentors_service/app/modules/sign_up/widgets/switch_mentor_mentee.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_outlinebutton.dart';
import 'package:mentors_service/common/widgets/custom_text_field.dart';
import 'package:mentors_service/common/widgets/custom_text_field.dart';
import 'package:mentors_service/common/widgets/have_an_account_text_button.dart';
import 'package:mentors_service/common/widgets/spacing.dart';
import 'package:mentors_service/common/widgets/text_required.dart';
import 'package:mentors_service/common/widgets/urbanist_font.dart';

class RoleAndProfileView extends StatefulWidget {
  const RoleAndProfileView({super.key});

  @override
  State<RoleAndProfileView> createState() => _RoleAndProfileViewState();
}

class _RoleAndProfileViewState extends State<RoleAndProfileView> {
  final SignUpController _signUpController = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

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
                    AppString.step2RoleAndProfileText,
                    style: AppStyles.h1(color: AppColors.primaryColor),
                  ),
                ),

                /// Role
                Column(
                  children: [
                    SizedBox(height: 15.h),
                    TextRequired(
                      text: AppString.defineRoleText,
                      textStyle: AppStyles.h3(family: "Schuyler"),
                    ),
                    SizedBox(height: 10.h),

                    ///Switch_mentorMentee
                    SwitchMentorMentee(signUpController: _signUpController)
                  ],
                ),

                /// Profile visibility
                SizedBox(height: 15.h),
                TextRequired(
                  text: AppString.profileVisibilityText,
                  textStyle: AppStyles.h4(family: "Schuyler"),
                ),
                SizedBox(height: 10.h),
                UrbanistFont(
                    title: AppString.profileVisibilityDescText,
                    color: AppColors.gray),
                SizedBox(height: 16.h),
                DropdownButtonFormField<String>(
                  value: _signUpController.profileVisibility,
                  padding: EdgeInsets.zero,
                  hint: const Text("Select profile visibility "),
                  items: _signUpController.profileVisibilityList
                      .map(
                        (gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ),
                      ).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select profile visibility';
                    }
                    return null;
                  },
                  onChanged: (newValue) {
                    setState(() {
                      _signUpController.profileVisibility = newValue;
                      print('Gender>>>${_signUpController.profileVisibility}');
                    });
                  },
                ),

                /// Matched with Mentor/mentee
                SizedBox(height: 15.h),
                TextRequired(
                  text: AppString.matchedMentorMenteeText,
                  textStyle: AppStyles.h4(family: "Schuyler"),
                ),
                SizedBox(height: 10.h),
                UrbanistFont(
                    title: AppString.matchedMentorMenteeDescText,
                    color: AppColors.gray),
                SizedBox(height: 16.h),
                DropdownButtonFormField<String>(
                  value: _signUpController.matchedInInstagram,
                  padding: EdgeInsets.zero,
                  hint: const Text("Select an option "),
                  items: _signUpController.matchedInInstagramList
                      .map(
                        (gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select an option ';
                    }
                    return null;
                  },
                  onChanged: (newValue) {
                    setState(() {
                      _signUpController.matchedInInstagram = newValue;
                      print('Gender>>>${_signUpController.matchedInInstagram}');
                    });
                  },
                ),

                /// what type of mentor are you looking for
                SizedBox(height: 15.h),
                buildMentorMenteeDescriptionSupportText(),
                SizedBox(height: 16.h),
                Obx(() {
                  return CustomTextField(
                    contentPaddingVertical: 15.h,
                    hintText: "Enter description",
                    controller: _signUpController.role.value == 'mentee'
                        ? _signUpController.whatTypeOfMenteeCtrl
                        : _signUpController.role.value == 'mentor'
                            ? _signUpController.whatTypeOfMentorCtrl
                            : _signUpController.whatTypeOfMenteeCtrl,
                  );
                }),
                /// I have read and accepted the Privacy Policy
                verticalSpacing(10.h),
                Row(
                  children: [
                    Obx(() {
                      return Checkbox(
                        activeColor: AppColors.primaryColor,
                        tristate: false,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.r))),
                        value: _signUpController.isChecked.value,
                        onChanged: (value) {
                          _signUpController.isChecked.value = value ?? false;
                        },
                      );
                    }),
                    HaveAnAccountTextButton(
                      firstText: AppString.iHaveReadAndAcceptText,
                      onTap: () {},
                      secondText: AppString.privacyPolicyText,
                      isShowStar: true,
                    )
                  ],
                ),

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
                    Obx((){
                      return  Expanded(
                        flex: 1,
                        child: CustomButton(
                          color: _signUpController.isChecked.value? AppColors.primaryColor : Colors.grey,
                            onTap: _signUpController.isChecked.value ? () {
                              if(_formKey.currentState!.validate()){
                                Get.toNamed(Routes.ACCOUNT_INFO);
                              }
                            }:(){},
                            text: 'Next'),
                      );
                    }

                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMentorMenteeDescriptionSupportText() {
    return Obx(() {
      return Wrap(
        runSpacing: 8.h,
        children: [
          TextRequired(
            text: _signUpController.role.value == 'mentee'
                ? AppString.whatTypeOfMentorLookingForText
                : _signUpController.role.value == 'mentor'
                    ? AppString.whatTypeOfMenteeYouCanSupportText
                    : AppString.whatTypeOfMentorLookingForText,
            textStyle: AppStyles.h4(family: "Schuyler"),
          ),
          SizedBox(height: 10.h),
          UrbanistFont(
              title: _signUpController.role.value == 'mentee'
                  ? AppString.whatTypeOfMentorLookingForDescText
                  : _signUpController.role.value == 'mentor'
                      ? AppString.whatTypeOfMenteeYouCanSupportDescText
                      : AppString.whatTypeOfMentorLookingForDescText,
              color: AppColors.gray),
          SizedBox(height: 16.h),
        ],
      );
    });
  }
}
