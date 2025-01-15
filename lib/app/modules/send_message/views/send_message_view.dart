import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mentors_service/app/modules/add_goal/views/add_goal_view.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_text_field.dart';
import 'package:mentors_service/common/widgets/profile_summery_card.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

class SendMessageView extends StatefulWidget {
  const SendMessageView({super.key});

  @override
  State<SendMessageView> createState() => _SendMessageViewState();
}

class _SendMessageViewState extends State<SendMessageView> {
  TextEditingController msgTec = TextEditingController();
  bool _isTextExpanded = false;

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
              ProfileSummeryCard(),
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
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      softWrap: true,
                      text: TextSpan(
                        text: _isTextExpanded
                            ? "This description is from the connection massage kjhkjhakjhkajshdjkshakjhd I am Shuvo alshdkajhsdkjs "
                            : " This description is from the connection massage a kjhfkjsdhf",
                        style: AppStyles.h5(color: Colors.black),
                        children: [
                          TextSpan(
                              text: _isTextExpanded ? " See less" : " See more",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // Replace with `AppStyles.h4()` equivalent
                                fontSize: 14,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    _isTextExpanded = !_isTextExpanded;
                                  });
                                }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpacing(16.h),
              Text(
                AppString.messageText,
                style: AppStyles.h3(),
              ),
              verticalSpacing(8.h),

              CustomTextField(
                filColor: AppColors.grayLight,
                controller: msgTec,
                maxLine: 5,
                hintText: 'Type a message...',
              ),
              verticalSpacing(16.h),
              AppCustomTextOrIconButton(
                text: AppString.sendMessageText,
                onTab: () {
                  showConnectionSentDialog(context);
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
