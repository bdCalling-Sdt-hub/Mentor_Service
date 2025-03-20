import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:mentors_service/app/data/external_url.dart';
import 'package:mentors_service/app/modules/add_goal/views/add_goal_view.dart';
import 'package:mentors_service/app/modules/search/model/find_mentor_mentee_model.dart';
import 'package:mentors_service/app/modules/send_connection/controllers/send_connection_controller.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/url_luncher/externer_url_luncher.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_text_field.dart';
import 'package:mentors_service/common/widgets/profile_summery_card.dart';
import 'package:mentors_service/common/widgets/see_more_text.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

class SendConnectionView extends StatefulWidget {
  const SendConnectionView({super.key});

  @override
  State<SendConnectionView> createState() => _SendConnectionViewState();
}

class _SendConnectionViewState extends State<SendConnectionView> {
  final SendConnectionController _connectionController = Get.put(SendConnectionController());
   MentorMenteeFindAttributes? mentorMenteeFindAttributes;
  @override
  void initState() {
    if(Get.arguments != null){
      getMentorMenteeDetails();
    }
    super.initState();
  }

  getMentorMenteeDetails(){
   final attributes  = Get.arguments['mentorMenteeAttributes'];
   mentorMenteeFindAttributes = attributes;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarTitle(text: 'Send Message'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Profile Summery card
              verticalSpacing(8.h),
              ProfileSummeryCard(
                isDateActive: false,
                name: "${mentorMenteeFindAttributes?.firstName} ${mentorMenteeFindAttributes?.lastName}",
                description: '${mentorMenteeFindAttributes?.branch}',
                imageUrl: '${ApiConstants.imageBaseUrl}${mentorMenteeFindAttributes?.profileImage?.imageUrl}',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Divider(
                  height: 2.h,
                  color: AppColors.grayLight,
                ),
              ),
              verticalSpacing(8.h),
              Text(
                AppString.descriptionsText,
                style: AppStyles.h3(),
              ),
              verticalSpacing(8.h),

              /// Description
              SeeMoreText(text: '${mentorMenteeFindAttributes?.description}'),
              verticalSpacing(16.h),
              Text(
                AppString.messageText,
                style: AppStyles.h3(),
              ),
              verticalSpacing(8.h),

              CustomTextField(
                filColor: AppColors.grayLight,
                controller: _connectionController.messageCtrl,
                maxLine: 5,
                hintText: 'Type a message...',
              ),
              verticalSpacing(16.h),
              AppCustomTextOrIconButton(
                text: AppString.sendMessageText,
                onTab: () async{
                  String message = _connectionController.messageCtrl.text.trim();
                  String email = mentorMenteeFindAttributes?.email??'';
                  String emailUrl = "mailto:$email?body=${Uri.encodeFull(message)} ";
                  if(mentorMenteeFindAttributes !=null && emailUrl.isNotEmpty){
                   await _connectionController.sendConnection(mentorMenteeFindAttributes?.sId??'', _connectionController.messageCtrl.text,()async{
                    return await ExternalUrlLauncher.lunchUrl(emailUrl.toString());
                   });
                  }
                  //showConnectionSentDialog(context);
                },
                isIconWithTextActive: true,
                iconPath: AppIcons.sentIcon,
                width: 170.w,
                height: 50.h,
                textColor: Colors.white,
                iconColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  void showConnectionSentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Optional rounded corners
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Circle with checkmark icon
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1), // Light green background
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 40.0,
                ),
              ),
              const SizedBox(height: 16.0),
              // Title
              Text(
                'Connection sent',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              // Subtitle
              Text(
                'The message is sent on the mentee\'s email.',
                textAlign: TextAlign.center,
                style: AppStyles.h5(color: Colors.grey[700]),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

}
