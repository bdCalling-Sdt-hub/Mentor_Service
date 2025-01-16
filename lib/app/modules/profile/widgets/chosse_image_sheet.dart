import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentors_service/app/modules/profile/controllers/profile_update_conreoller.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';

class ChooseImageSheet extends StatelessWidget {
  const ChooseImageSheet({
    super.key,
    required ProfileUpdateController profileUpdateController,
  }) : _profileUpdateController = profileUpdateController;

  final ProfileUpdateController _profileUpdateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppString.choseAFileText,
          style: AppStyles.h2(),
        ),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Image Picker
              GestureDetector(
                onTap: () {
                  _profileUpdateController.pickImageFromCameraForProfilePic(ImageSource.gallery);
                },
                child: SvgPicture.asset(
                  AppIcons.photographLogo,
                  height: 90.h,
                  width: 90.h,
                  colorFilter: ColorFilter.mode(
                      AppColors.appGreyColor, BlendMode.srcIn),
                ),
              ),

              /// Camera Picker
              SizedBox(width: 50.w),
              GestureDetector(
                onTap: () {
                  _profileUpdateController.pickImageFromCameraForProfilePic(ImageSource.camera);
                },
                child: SvgPicture.asset(
                  AppIcons.cameraIcon,
                  height: 85.h,
                  width: 85.h,
                  colorFilter: ColorFilter.mode(
                      AppColors.appGreyColor, BlendMode.srcIn),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}