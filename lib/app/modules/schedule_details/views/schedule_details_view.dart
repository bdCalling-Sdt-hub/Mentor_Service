import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:mentors_service/app/modules/home/model/schedule_model.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/profile_summery_card.dart';
import 'package:mentors_service/common/widgets/see_more_text.dart';
import 'package:mentors_service/common/widgets/spacing.dart';


class ScheduleDetailsView extends StatefulWidget {
  const ScheduleDetailsView({super.key});

  @override
  State<ScheduleDetailsView> createState() => _ScheduleDetailsViewState();
}

class _ScheduleDetailsViewState extends State<ScheduleDetailsView> {
  late ScheduleResults _scheduleResults ;
  @override
  void initState() {
    super.initState();
    if(Get.arguments != null){
      getScheduleDetails();
    }
  }
  getScheduleDetails(){
    final results = Get.arguments['scheduleResults'];
    if(results != null){
      _scheduleResults = results;
    }
     print(_scheduleResults);
  }
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
          date: _scheduleResults.appointmentDate != null ? DateFormat('EE, dd.yyyy').format(_scheduleResults.appointmentDate!):'',
          name: '${_scheduleResults.creator?.firstName} ${_scheduleResults.creator?.lastName}',
          description: '${_scheduleResults.creator?.branch}',
          imageUrl: '${ApiConstants.imageBaseUrl}/${_scheduleResults.creator?.profileImage?.imageUrl}',
        ),
            verticalSpacing(6.h),
            Divider(height: 2.h,color: AppColors.grayLight,),
            verticalSpacing(6.h),
            Text(AppString.descriptionsText,style: AppStyles.h3(),),
            verticalSpacing(6.h),
            SeeMoreText(text: '${_scheduleResults.description}',
              style: AppStyles.h5(color: Colors.black54),
              characterLimit: 150,
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
