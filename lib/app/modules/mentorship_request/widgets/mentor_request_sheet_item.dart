import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/success_alertdialog.dart';

class MentorRequestSheetItem extends StatelessWidget {
  const MentorRequestSheetItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Makes it only take necessary space
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Close Button and Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mentorship Requests",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Request Title Field
        Text(
          "Request title",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter request title",
          ),
        ),
        SizedBox(height: 16.h),

        // Description Field
        Text(
          "Description",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter description",
          ),
        ),
        SizedBox(height: 16.h),

        // Submit Button
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            onPressed: () {
              // Add form submission logic here
              showSuccessDialog(context);
            },
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
            label: Text(
              "Submit",
              style: AppStyles.h3(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
            ),
          ),
        ),
      ],
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) => SuccessDialog(),
    );
  }
}
