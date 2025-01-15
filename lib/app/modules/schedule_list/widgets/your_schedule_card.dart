import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_card.dart';
import 'package:mentors_service/common/widgets/custom_outlinebutton.dart';
import 'package:mentors_service/common/widgets/icon_and_text.dart';
import 'package:mentors_service/common/widgets/profile_summery_card.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

class YourScheduleCard extends StatelessWidget {
  const YourScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: CustomCard(
        cardColor: AppColors.white,
        borderSideColor: AppColors.primaryColor,
        elevation: 2,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileSummeryCard(),
          /// Title and Confirm / Not Available
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Schedule 2',
                style: AppStyles.h3(),
              ),
              CustomCard(
                borderRadius: 20.r,
                cardHeight: 60.h,
                padding: 7.sp,
                cardColor: Colors.green.shade100,
                borderSideColor: Colors.green.shade100,
                elevation: 0,
                children: [
                  Text(
                    'Confirm',
                    style: AppStyles.h4(
                        color: Colors.green, fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),

          /// Date and Time
          const SizedBox(height: 8.0),
          SizedBox(
            width: 192.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: IconText(
                    iconData: Icons.calendar_month_outlined,
                    text: '12-12-24',
                    textStyle: AppStyles.h5(color: Colors.grey.shade700),
                  ),
                ),
                Expanded(
                    child: IconText(
                        iconData: Icons.access_time_outlined,
                        text: '10 : 00 Am',
                        textStyle: AppStyles.h5(color: Colors.grey.shade700))),
              ],
            ),
          ),

          const SizedBox(height: 16.0),

          /// Type of Link
          Text(
            'Type of link: Zoom meeting',
            style: AppStyles.h5(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 8.0),
          // Link with Copy Button
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0.r),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8.0.r),
                  ),
                  child: const Text(
                    'https://www.youtube.com/watch?...',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),

              /// Copy link to clipboard
              const SizedBox(width: 8.0),
              IconButton(
                onPressed: () {
                  const String link = 'https://www.youtube.com/watch?';
                  Clipboard.setData(ClipboardData(text: link));
                  Get.snackbar('Link Copied', 'https://www.youtube.com/watch?');
                },
                icon: const Icon(
                  Icons.copy,
                  size: 22.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          /// Description
          const SizedBox(height: 16.0),
          Text(
            'A dedicated Army professional with extensive experience in leadership ... See more',
            style: AppStyles.h5(color: Colors.grey.shade700),
          ),

          /// Action Button
          SizedBox(height: 12.h),

          Row(
            children: [
              CustomButton(
                onTap: () {
                  showScheduleDialog(isConfirm: true, context);
                },
                width: 140.w,
                height: 55.h,
                text: AppString.confirmText,
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomOutlineButton(
                onTap: () {
                  showScheduleDialog(isConfirm: false, context);
                },
                width: 120.w,
                height: 55.h,
                text: AppString.notAvailableText,
                textStyle: AppStyles.h5(),
              ),
            ],
          ),
          verticalSpacing(8.h),
        ],
      ),
    );
  }

  void showScheduleDialog(BuildContext context, {required bool isConfirm}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(16.0), // Optional rounded corners
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Circle with checkmark icon
              Container(
                decoration: BoxDecoration(
                  color: isConfirm? Colors.green.withOpacity(0.1):Colors.red.withOpacity(0.1),
                  // Light green background
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Icon(isConfirm?Icons.help_center_outlined : Icons.warning_amber,
                  color: isConfirm?Colors.green: Colors.red,
                  size: 40.0,
                ),
              ),
              const SizedBox(height: 16.0),
              // Title
              Text(
                isConfirm?'Are You Sure ?':'Alert',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              // Subtitle
              Text(isConfirm?'So, you are available at the scheduled time?': 'So, you are not available at the scheduled time?',
                textAlign: TextAlign.center,
                style: AppStyles.h5(color: Colors.grey[700]),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CustomButton(onTap: (){
                    Get.back();
                  }, text: 'Close',color: Colors.blue[50],textStyle: AppStyles.h4(color: Colors.blue),),
                ),
                horizontalSpacing(8.w),
                Flexible(
                  flex: 1,
                  child: CustomButton(onTap: () {}, text: 'Yes',color: isConfirm? Colors.green:Colors.red,),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
