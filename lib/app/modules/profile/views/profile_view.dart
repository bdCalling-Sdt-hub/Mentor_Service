import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/modules/mentorship_request/widgets/mentorship_request_card.dart';
import 'package:mentors_service/app/modules/profile/widgets/switch_visibility.dart';
import 'package:mentors_service/app/modules/profile/widgets/title_and_button.dart';
import 'package:mentors_service/app/modules/sign_up/widgets/switch_mentor_mentee.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                  onTab: () {
                    Get.toNamed(Routes.EDIT_PROFILE);
                  },
                  isIconWithTextActive: true,
                  iconPath: AppIcons.editLogo,
                  iconHeight: 18.h,
                ),
              ),

              /// Profile summery
              verticalSpacing(10.h),
              ProfileSummeryCard(
                isDateActive: false,
                imageHeight: 120.h,
                imageWidth: 120.w,
                name: 'Shuvo Kh',
                description: 'I want to learn how to fly and fighter jet from',
                imageUrl: AppNetworkImage.golfPlayerImg,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(AppString.firstNameText,
                  style: AppStyles.h4(family: "Schuyler")),
              SizedBox(
                height: 10.h,
              ),
              customListTile('Shuvo'),
              SizedBox(height: 10.h),
              Text(AppString.lastNameText,
                  style: AppStyles.h4(family: "Schuyler")),
              SizedBox(
                height: 10.h,
              ),
              customListTile('Kh'),
              SizedBox(height: 10.h),
              Text(AppString.branchText, style: AppStyles.h3()),
              SizedBox(height: 10.h),
              customListTile(
                'Navy',
              ),
              SizedBox(height: 10.h),
              Text(AppString.currentStatusText, style: AppStyles.h3()),
              SizedBox(height: 10.h),
              customListTile(
                'Active',
              ),
              SizedBox(height: 10.h),
              Text(AppString.instagramOptionalText, style: AppStyles.h3()),
              SizedBox(height: 10.h),
              customListTile(
                'ShuvoKh153',
              ),
              SizedBox(height: 10.h),
              Text(AppString.matchedMentorMenteeText,
                  style: AppStyles.h4(family: "Schuyler")),
              SizedBox(
                height: 4.h,
              ),
              UrbanistFont(
                  title: AppString.matchedMentorMenteeDescText,
                  color: AppColors.gray),
              SizedBox(height: 10.h),
              customListTile('Yes'),

              /// Profile visibility
              SizedBox(height: 15.h),
              Text(
                AppString.profileVisibilityText,
                style: AppStyles.h4(family: "Schuyler"),
              ),
              SizedBox(height: 10.h),
              customListTile(
                'Visible',
              ),

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

  customListTile(String title, {String? icon}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 1),
          color: AppColors.fillColor,
          borderRadius: BorderRadius.circular(16).r),
      child: ListTile(
        // leading: SvgPicture.asset(icon??''),
        title: Text(
          title,
          style: AppStyles.customSize(
            size: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.subTextColor,
            family: "Schuyler",
          ),
        ),
      ),
    );
  }
}
