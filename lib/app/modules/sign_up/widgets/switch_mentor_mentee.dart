import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mentors_service/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

class SwitchMentorMentee extends StatelessWidget {
  const SwitchMentorMentee(
      {super.key, required SignUpController signUpController})
      : _signUpController = signUpController;

  final SignUpController _signUpController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Mentee
        Obx(() {
          return Checkbox(
            activeColor: AppColors.primaryColor,
            tristate: false,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            value: _signUpController.isMenteeChecked.value,
            onChanged: (value) {
              _signUpController.isMenteeChecked.value = value ?? false;
              _signUpController.isMentorChecked.value = false;
              _signUpController.role.value = value == true ? 'Mentee' : '';
             _signUpController.whatTypeOfMentorCtrl.clear();
            },
          );
        }),
        horizontalSpacing(5.w),
        Text(AppString.menteeText, style: AppStyles.h5(family: "Schuyler")),
        horizontalSpacing(20.w),

        /// Mentor
        Obx(() {
          return Checkbox(
            activeColor: AppColors.primaryColor,
            tristate: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            value: _signUpController.isMentorChecked.value,
            onChanged: (value) {
              _signUpController.isMentorChecked.value = value ?? false;
              _signUpController.isMenteeChecked.value = false;
              _signUpController.role.value=value==true?'Mentor' : '';
              _signUpController.whatTypeOfMenteeCtrl.clear();
            },
          );
        }),
        horizontalSpacing(5.w),
        Text(AppString.mentorText, style: AppStyles.h5(family: "Schuyler")),
      ],
    );
  }
}
