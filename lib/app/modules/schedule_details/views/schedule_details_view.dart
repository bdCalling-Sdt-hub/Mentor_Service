import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/profile_summery_card.dart';
import 'package:mentors_service/common/widgets/spacing.dart';


class ScheduleDetailsView extends StatelessWidget {
  const ScheduleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarTitle(text: 'Schedule Details'),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ProfileSummeryCard(
          date: '12.12.25',
          name: 'Shuvo Kh',
          description: 'navy',
          imageUrl: AppNetworkImage.golfPlayerImg,
        ),
            verticalSpacing(6.h),
            Divider(height: 2.h,color: AppColors.grayLight,),
            verticalSpacing(6.h),
            Text(AppString.descriptionsText,style: AppStyles.h3(),),
            verticalSpacing(6.h),
            Text('A dedicated Army professional with extensive experience in leadership, strategy, '
                'and discipline. Passionate about guiding individuals through career development, '
                'skill enhancement, and transitioning into or out of military roles. ',style: AppStyles.h5(),
            ),
            verticalSpacing(18.h),
            AppCustomTextOrIconButton(
              text: 'Edit',
              containerVerticalPadding: 8,
              width: 100.w,
              onTab: () {
                Get.toNamed(Routes.ADD_SCHEDULE,arguments: {'isEdit':true});
              },
              isIconWithTextActive: true,
              iconPath: AppIcons.editLogo,
              textColor: Colors.white,
              iconColor:  Colors.white,
            ),

          ],
        ),
      ),
    );
  }
}
