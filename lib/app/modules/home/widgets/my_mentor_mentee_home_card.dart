import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';

import '../../../../common/widgets/casess_network_image.dart';

class MyMentorMenteeHomeCard extends StatelessWidget {
  const MyMentorMenteeHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Profile Image
        CustomNetworkImage(
          imageUrl: AppNetworkImage.golfPlayerImg,
          height: 86.h,
          width: 86.w,
          boxShape: BoxShape.circle,
        ),
        const SizedBox(width: 16), // Spacing between image and text content
        // Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // Name
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4), // Spacing between name and description
              // Description
              Text(
                'I want to learn how to fly and fighter jet from.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16), // Spacing between text content and button
        // Details Button
        ElevatedButton.icon(
          onPressed: () {
            // Implement button action
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            backgroundColor: AppColors.primaryColor, // Button background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
          icon: const Icon(
            Icons.info_outline,
            size: 16,
            color: Colors.white,
          ),
          label: const Text(
            'Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
