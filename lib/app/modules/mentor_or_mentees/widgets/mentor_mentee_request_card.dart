import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/date_time_formation/data_age_formation.dart';
import 'package:mentors_service/common/date_time_formation/difference_formation.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

import '../../../../common/widgets/casess_network_image.dart';
import '../../../../common/widgets/custom_outlinebutton.dart';

class MentorMenteeRequestCard extends StatefulWidget {
  const MentorMenteeRequestCard({super.key});

  @override
  State<MentorMenteeRequestCard> createState() => _MentorMenteeRequestCardState();
}

class _MentorMenteeRequestCardState extends State<MentorMenteeRequestCard> {
  final DataAgeFormation _dataAgeFormation = DataAgeFormation();

  final DifferenceFormation _differenceFormation = DifferenceFormation();
  bool _isTextExpanded=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
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
                      Text(_dataAgeFormation.formatContentAge(_differenceFormation.formatDifference(DateTime.now())), style: AppStyles.h6()),
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
                            text:_isTextExpanded?"This description is from the connection massage kjhkjhakjhkajshdjkshakjhd I am Shuvo alshdkajhsdkjs "
                                : " This description is from the connection massage a kjhfkjsdhf",
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

                  /// Action Button
                  Row(
                    children: [
                      CustomButton(
                        onTap: () async {},
                        width: 100.w,
                        height: 40.h,
                        text: "Accept",
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CustomOutlineButton(
                        onTap: () {},
                        width: 100.w,
                        height: 40.h,
                        text: AppString.cancelText,
                        textStyle: AppStyles.h5(color: Colors.redAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
