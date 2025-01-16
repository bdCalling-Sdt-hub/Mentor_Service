import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mentors_service/app/modules/profile/controllers/profile_controller.dart';
import 'package:mentors_service/app/modules/profile/controllers/profile_update_conreoller.dart';
import 'package:mentors_service/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

class SwitchVisibility extends StatelessWidget {
  const SwitchVisibility({super.key, required ProfileUpdateController profileUpdateController})
      : _profileUpdateController = profileUpdateController;

  final ProfileUpdateController _profileUpdateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Visible
        ListTile(
          leading: Obx(() {
          return Checkbox(
            activeColor: AppColors.primaryColor,
            tristate: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            value: _profileUpdateController.isVisibleChecked.value,
            onChanged: (value) {
              _profileUpdateController.isVisibleChecked.value = value ?? false;
              _profileUpdateController.isHideChecked.value = false;
            },
          );
        }) ,
          title: Text('Visible',style: AppStyles.h3()),
          subtitle: Text(AppString.visibleSupportText, style: AppStyles.h5(family: "Schuyler",color: Colors.grey)) ,
        ),
        verticalSpacing(10.h),
        /// hide
        ListTile(
          leading: Obx(() {
            return Checkbox(
              activeColor: AppColors.primaryColor,
              tristate: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
              value: _profileUpdateController.isHideChecked.value,
              onChanged: (value) {
                _profileUpdateController.isHideChecked.value = value ?? false;
                _profileUpdateController.isVisibleChecked.value = false;
              },
            );
          }
          ),
          title: Text('Hide',style: AppStyles.h3(),),
          subtitle: Text(AppString.hideSupportText, style: AppStyles.h5(family: "Schuyler",color: Colors.grey)) ,
        )

      ],
    );
  }
}
