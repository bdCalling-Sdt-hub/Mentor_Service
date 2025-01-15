import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

import 'casess_network_image.dart';
import 'icon_and_text.dart';

class ProfileSummeryCard extends StatelessWidget {
  const ProfileSummeryCard({
    super.key, this.isDateActive = true, this.imageHeight, this.imageWidth,
  });
 final bool isDateActive;
 final double? imageHeight;
 final double? imageWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Profile Image
        CustomNetworkImage(
          imageUrl: AppNetworkImage.golfPlayerImg,
          height: imageHeight?? 86.h,
          width: imageWidth?? 86.w,
          boxShape: BoxShape.circle,
        ),
        const SizedBox(width: 13.0),
        /// Profile Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name and Role
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        'John Doe',
                        style: AppStyles.h2(),
                      ),
                      SizedBox(height: 4.0.h),
                      Text(
                        'Army',
                        style: AppStyles.h4(color:Colors.grey ),
                      ),
                      verticalSpacing(4.0.h),
                      if(isDateActive)
                      SizedBox(
                          width: 100.w,
                          child: IconText(iconData: Icons.calendar_month_outlined, text: '12-12-25 '))
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8.0),

            ],
          ),
        ),
      ],
    );
  }
}