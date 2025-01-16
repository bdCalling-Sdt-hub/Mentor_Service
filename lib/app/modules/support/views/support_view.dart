import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/modules/add_goal/views/add_goal_view.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';

import '../controllers/support_controller.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key});

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBarTitle(text: 'Support'),
      body:  Padding(
        padding:  EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name Field
            Text(
              "Name",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.h),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your name",
              ),
            ),
            SizedBox(height: 16.h),

            // Subject Field
            Text(
              "Subject",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.h),
            TextField(
              controller: subjectController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter subject",
              ),
            ),
            SizedBox(height: 16.h),

            // Message Field
            Text(
              "Message",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.h),
            TextField(
              controller: messageController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write a message for your new admin ...",
              ),
            ),
            SizedBox(height: 24.h),

            // Send Button
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                onTap: () {
                  // Handle the send action
                },
                text: 'Send',
              ),
            ),
          ],
        ),
      )
    );
  }
}
