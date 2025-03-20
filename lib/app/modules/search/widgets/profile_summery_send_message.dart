import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:mentors_service/app/modules/search/model/find_mentor_mentee_model.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/casess_network_image.dart';
import 'package:mentors_service/common/widgets/see_more_text.dart';

class ProfileSummerySendMessage extends StatefulWidget {
 final MentorMenteeFindAttributes mentorMenteeFindAttributes;
  const ProfileSummerySendMessage({
    super.key, required this.mentorMenteeFindAttributes,
  }) ;
  @override
  State<ProfileSummerySendMessage> createState() => _ProfileSummerySendMessageState();
}

class _ProfileSummerySendMessageState extends State<ProfileSummerySendMessage> {

   bool _isTextExpanded=false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomNetworkImage(
          imageUrl: '${ApiConstants.imageBaseUrl}${widget.mentorMenteeFindAttributes.profileImage?.imageUrl}',
          height: 86.h,
          width: 86.w,
          boxShape: BoxShape.circle,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Name
                    Text(
                      "${widget.mentorMenteeFindAttributes.firstName} ${widget.mentorMenteeFindAttributes.lastName}",
                      style: AppStyles.h3(),
                    ),
                    InkWell(
                        onTap: (){
                          Get.toNamed(Routes.SEND_MESSAGE,arguments: {'mentorMenteeAttributes':widget.mentorMenteeFindAttributes});
                        },
                        child: const Icon(Icons.email_outlined,color: AppColors.primaryColor,))
                  ],
                ),

                /// Title or position
                Text(
                  "${widget.mentorMenteeFindAttributes.branch}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: AppStyles.h5(),
                ),
                SizedBox(height: 10.h),
                /// Description
                SeeMoreText(text: '${widget.mentorMenteeFindAttributes.description}'),
                SizedBox(height: 10.h),

              ],
            ),
          ),
        )
      ],
    );
  }
}