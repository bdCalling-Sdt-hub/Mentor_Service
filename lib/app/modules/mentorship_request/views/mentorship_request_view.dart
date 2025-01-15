import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/modules/mentorship_request/widgets/mentorship_request_card.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/spacing.dart';
import 'package:mentors_service/common/widgets/urbanist_font.dart';

import '../controllers/mentorship_request_controller.dart';

class MentorshipRequestView extends StatelessWidget {
  const MentorshipRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarTitle(text: 'Mentorship Request'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Mentorship request
            verticalSpacing(15.h),
            Text(
              AppString.mentorshipRequestsText,
              style: AppStyles.h4(family: "Schuyler"),
            ),
            SizedBox(height: 10.h),
            UrbanistFont(
              title: AppString.ifYouCantFindSpecificMentorDescText,
              color: AppColors.gray,
            ),
            verticalSpacing(10.h),
            MentorShipRequestCard(),
            verticalSpacing(20.h),
            AppCustomTextOrIconButton(
              height: 50.h,
              text: 'Create new request',
              onTab: () {},
              isIconWithTextActive: true,
              iconPath: AppIcons.addIcon,
              iconHeight: 25.h,
            ),
            verticalSpacing(40.h)
          ],
        ),
      ),
    );
  }
}
