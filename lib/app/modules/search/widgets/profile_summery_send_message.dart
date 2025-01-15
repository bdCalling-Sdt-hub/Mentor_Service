import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/casess_network_image.dart';

class ProfileSummerySendMessage extends StatefulWidget {
  const ProfileSummerySendMessage({
    super.key,
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
          imageUrl: AppNetworkImage.golfPlayerImg,
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
                      "Shuvo Kh",
                      style: AppStyles.h3(),
                    ),
                    InkWell(
                        onTap: (){
                          Get.toNamed(Routes.SEND_MESSAGE);
                        },
                        child: const Icon(Icons.email_outlined,color: AppColors.primaryColor,))
                  ],
                ),

                /// Title or position
                Text(
                  "Navy",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: AppStyles.h5(),
                ),
                SizedBox(height: 10.h),

                /// Description
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        softWrap: true,
                        text: TextSpan(
                          text:_isTextExpanded?"This description is from the connection message kjhkjhakjhkajshdjkshakjhd I am Shuvo alshdkajhsdkjs "
                              : " This description is from the connection message a kjhfkjsdhf",
                          style: TextStyle(
                            color: Colors.grey, // Replace with `AppStyles.h5()` equivalent
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                                text: _isTextExpanded ? " See less" : " See more",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold, // Replace with `AppStyles.h4()` equivalent
                                  fontSize: 14,
                                ),
                                recognizer: TapGestureRecognizer()..onTap=(){
                                   setState(() {
                                     _isTextExpanded = !_isTextExpanded;
                                  });
                                }
                            ),

                          ],
                        ),

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

              ],
            ),
          ),
        )
      ],
    );
  }
}