import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/modules/mentorship_request/widgets/mentorship_request_card.dart';
import 'package:mentors_service/app/modules/profile/widgets/switch_visibility.dart';
import 'package:mentors_service/app/modules/profile/widgets/title_and_button.dart';
import 'package:mentors_service/app/modules/sign_up/widgets/switch_mentor_mentee.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_card.dart';
import 'package:mentors_service/common/widgets/custom_text_field.dart';
import 'package:mentors_service/common/widgets/profile_summery_card.dart';
import 'package:mentors_service/common/widgets/spacing.dart';
import 'package:mentors_service/common/widgets/text_required.dart';
import 'package:mentors_service/common/widgets/title_and_seeAll.dart';
import 'package:mentors_service/common/widgets/urbanist_font.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarTitle(text: 'Profile'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Edit Profile Button
              Align(
                alignment: Alignment.centerRight,
                child: AppCustomTextOrIconButton(
                  height: 40.h,
                  width: 130.w,
                  text: 'Edit Profile',
                  onTab: () {},
                  isIconWithTextActive: true,
                  iconPath: AppIcons.editLogo,
                  iconHeight: 18.h,
                ),
              ),
              /// Profile summery
              verticalSpacing(10.h),
              ProfileSummeryCard(isDateActive: false,imageHeight: 120.h, imageWidth: 120.w,),
              /// First name
              verticalSpacing(15.h),
              TextRequired(
                text: AppString.firstNameText,
                textStyle: AppStyles.h4(family: "Schuyler"),
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                contentPaddingVertical: 15.h,
                hintText: "Type your first name",
                controller: _profileController.firstNameCtrl,
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
                controller: _profileController.lastNameCtrl,
              ),

              /// Branch
              SizedBox(height: 15.h),
              TextRequired(
                text: AppString.branchText,
                textStyle: AppStyles.h4(family: "Schuyler"),
              ),
              SizedBox(height: 10.h),
              DropdownButtonFormField<String>(
                value: _profileController.branch,
                padding: EdgeInsets.zero,
                hint: const Text("Select Branch"),
                items: _profileController.branchList
                    .map(
                      (gender) => DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      ),
                    )
                    .toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Select Branch';
                  }
                  return null;
                },
                onChanged: (newValue) {
                  setState(() {
                    _profileController.branch = newValue;
                    print('Gender>>>${_profileController.branch}');
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
                value: _profileController.currentStatus,
                padding: EdgeInsets.zero,
                hint: const Text("Select current status "),
                items: _profileController.currentStatusList
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
                    _profileController.currentStatus = newValue;
                    print('Gender>>>${_profileController.currentStatus}');
                  });
                },
              ),

              /// Instagram Username
              verticalSpacing(15.h),
              Text(
                AppString.instagramOptionalText,
                style: AppStyles.h4(family: "Schuyler"),
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                contentPaddingVertical: 15.h,
                hintText: "Type your username",
                controller: _profileController.instagramNameCtrl,
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
                value: _profileController.matchedInInstagram,
                padding: EdgeInsets.zero,
                hint: const Text("Select an option "),
                items: _profileController.matchedInInstagramList
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
                    _profileController.matchedInInstagram = newValue;
                    print('Gender>>>${_profileController.matchedInInstagram}');
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
                  maxLine: 4,
                  hintText: "Enter description",
                  controller: _profileController.role.value == 'Mentee'
                      ? _profileController.whatTypeOfMenteeCtrl
                      : _profileController.role.value == 'Mentor'
                          ? _profileController.whatTypeOfMentorCtrl
                          : _profileController.whatTypeOfMenteeCtrl,
                );
              }),
              verticalSpacing(15.h),

              /// Profile visibility
              SizedBox(height: 15.h),
              TextRequired(
                text: AppString.profileVisibilityText,
                textStyle: AppStyles.h4(family: "Schuyler"),
              ),
              SizedBox(height: 10.h),
              SwitchVisibility(profileController: _profileController),
              verticalSpacing(40.h)
            ],
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
            text: _profileController.role.value == 'Mentee'
                ? AppString.whatTypeOfMentorLookingForText
                : _profileController.role.value == 'Mentor'
                    ? AppString.whatTypeOfMenteeYouCanSupportText
                    : AppString.whatTypeOfMentorLookingForText,
            textStyle: AppStyles.h4(family: "Schuyler"),
          ),
          SizedBox(height: 10.h),
          UrbanistFont(
              title: _profileController.role.value == 'Mentee'
                  ? AppString.whatTypeOfMentorLookingForDescText
                  : _profileController.role.value == 'Mentor'
                      ? AppString.whatTypeOfMenteeYouCanSupportDescText
                      : AppString.whatTypeOfMentorLookingForDescText,
              color: AppColors.gray),
          SizedBox(height: 16.h),
        ],
      );
    });
  }


}
