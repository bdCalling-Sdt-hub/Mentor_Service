import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentors_service/app/modules/mentorship_request/widgets/mentorship_request_card.dart';
import 'package:mentors_service/app/modules/profile/controllers/profile_update_conreoller.dart';
import 'package:mentors_service/app/modules/profile/widgets/chosse_image_sheet.dart';
import 'package:mentors_service/app/modules/profile/widgets/switch_visibility.dart';
import 'package:mentors_service/app/modules/profile/widgets/title_and_button.dart';
import 'package:mentors_service/app/modules/sign_up/widgets/switch_mentor_mentee.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_constant/app_constant.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/casess_network_image.dart';
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

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final ProfileUpdateController _profileUpdateController =
      Get.put(ProfileUpdateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarTitle(text: 'Edit Profile'),
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
                    width: 140.w,
                    text: 'Save Changes',
                    onTab: () {},
                  ),
                ),

                /// Profile picture
                SizedBox(
                  height: 130.h,
                  child: Stack(
                    children: [
                      /// Profile Picture
                      Align(
                        alignment: Alignment.center,
                        child: ProfileSummeryCard(
                          isDateActive: false,
                          imageHeight: 120.h,
                          imageWidth: 120.w,
                          name: 'Shuvo Kh',
                          description: 'I want to learn how to fly and fighter jet from',
                          imageUrl: AppNetworkImage.golfPlayerImg,
                        ),
                      ),

                      /// Profile Image Edit Button
                      Positioned(
                        left: 80.w,
                        top: 85.h,
                        child: InkWell(
                          onTap: () {
                            _showImagePickerBottomSheet(context);
                          },
                          child: Container(
                            height: 35.h,
                            width: 35.h,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0.sp),
                              child: SvgPicture.asset(
                                AppIcons.editLogo,
                                colorFilter: const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

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
                  controller: _profileUpdateController.firstNameCtrl,
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
                  controller: _profileUpdateController.lastNameCtrl,
                ),

                /// Branch
                SizedBox(height: 15.h),
                TextRequired(
                  text: AppString.branchText,
                  textStyle: AppStyles.h4(family: "Schuyler"),
                ),
                SizedBox(height: 10.h),
                DropdownButtonFormField<String>(
                  value: _profileUpdateController.branch,
                  padding: EdgeInsets.zero,
                  hint: const Text("Select Branch"),
                  items: _profileUpdateController.branchList
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
                      _profileUpdateController.branch = newValue;
                      print('Gender>>>${_profileUpdateController.branch}');
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
                  value: _profileUpdateController.currentStatus,
                  padding: EdgeInsets.zero,
                  hint: const Text("Select current status "),
                  items: _profileUpdateController.currentStatusList
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
                      _profileUpdateController.currentStatus = newValue;
                      print(
                          'Gender>>>${_profileUpdateController.currentStatus}');
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
                  controller: _profileUpdateController.instagramNameCtrl,
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
                  value: _profileUpdateController.matchedInInstagram,
                  padding: EdgeInsets.zero,
                  hint: const Text("Select an option "),
                  items: _profileUpdateController.matchedInInstagramList
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
                      _profileUpdateController.matchedInInstagram = newValue;
                      print(
                          'Gender>>>${_profileUpdateController.matchedInInstagram}');
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
                    controller: _profileUpdateController.role.value == 'Mentee'
                        ? _profileUpdateController.whatTypeOfMenteeCtrl
                        : _profileUpdateController.role.value == 'Mentor'
                            ? _profileUpdateController.whatTypeOfMentorCtrl
                            : _profileUpdateController.whatTypeOfMenteeCtrl,
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
                SwitchVisibility(
                    profileUpdateController: _profileUpdateController),
                verticalSpacing(40.h)
              ],
            ),
          ),
        ));
  }

  Widget buildMentorMenteeDescriptionSupportText() {
    return Obx(() {
      return Wrap(
        runSpacing: 8.h,
        children: [
          TextRequired(
            text: _profileUpdateController.role.value == 'Mentee'
                ? AppString.whatTypeOfMentorLookingForText
                : _profileUpdateController.role.value == 'Mentor'
                    ? AppString.whatTypeOfMenteeYouCanSupportText
                    : AppString.whatTypeOfMentorLookingForText,
            textStyle: AppStyles.h4(family: "Schuyler"),
          ),
          SizedBox(height: 10.h),
          UrbanistFont(
              title: _profileUpdateController.role.value == 'Mentee'
                  ? AppString.whatTypeOfMentorLookingForDescText
                  : _profileUpdateController.role.value == 'Mentor'
                      ? AppString.whatTypeOfMenteeYouCanSupportDescText
                      : AppString.whatTypeOfMentorLookingForDescText,
              color: AppColors.gray),
          SizedBox(height: 16.h),
        ],
      );
    });
  }

  void _showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200.h,
          child: ChooseImageSheet(
              profileUpdateController: _profileUpdateController),
        );
      },
    );
  }
}
