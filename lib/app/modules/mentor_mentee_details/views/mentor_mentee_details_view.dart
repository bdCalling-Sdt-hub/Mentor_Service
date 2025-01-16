import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/modules/mentor_mentee_details/widgets/schedule_list.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/casess_network_image.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_outlinebutton.dart';
import 'package:mentors_service/common/widgets/icon_and_text.dart';
import 'package:mentors_service/common/widgets/profile_summery_card.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

import '../widgets/goal_card.dart';

class MentorMenteeDetailsView extends StatefulWidget {
  const MentorMenteeDetailsView({super.key});

  @override
  State<MentorMenteeDetailsView> createState() => _MentorMenteeDetailsViewState();
}

class _MentorMenteeDetailsViewState extends State<MentorMenteeDetailsView> {

  final List<String> tabBarList = ["Schedule", "Goal"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTitle(text: 'Mentor details'),
      body: SafeArea(
        child: DefaultTabController(
            length: tabBarList.length,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Profile Summery
                  SizedBox(height: 16.h),
                  ProfileSummeryCard(
                    date: '12.12.25',
                    name: 'Shuvo Kh',
                    description: 'navy',
                    imageUrl: AppNetworkImage.golfPlayerImg,
                  ),
                  verticalSpacing(15.h),
                  /// Description
                   Text(
                    AppString.descriptionsText,
                    style:AppStyles.h3(),
                  ),
                  verticalSpacing(8.h),
                  Text(
                    'I want to learn how to fly and fighter jet from. lahlksdkljahdkjhfkjsdhfkjsdhkfjhsdk',
                    style:AppStyles.h4(color: Colors.grey),
                  ),
                  const SizedBox(height: 16.0),

                  /// Message Button
                  AppCustomTextOrIconButton(
                    height: 40.h,
                    width: 112.w,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    buttonColor: AppColors.primaryColor,
                    text: AppString.messageText,
                    onTab: (){
                      Get.toNamed(Routes.SEND_MESSAGE);
                    },
                    isIconWithTextActive: true,
                    iconPath: AppIcons.messageIcons,
                  ),

                  verticalSpacing(8.h),
                  /// Tab Bar
                  TabBar(
                    indicatorColor: AppColors.primaryColor,
                    dividerColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    labelStyle: AppStyles.customSize(
                      size: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor,
                    ),
                    unselectedLabelStyle: AppStyles.customSize(
                      size: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.subTextColor,
                    ),
                    tabs: [
                      for (String tab in tabBarList) Tab(text: tab.tr),
                    ],
                  ),

                  /// Tab Bar View
                  Expanded(
                    child: TabBarView(
                      children: [
                        ScheduleList(),
                        GoalCard()
                      ],
                    ),
                  ),

                ],
              ),
            )

        ),
      ),
    );
  }

}
