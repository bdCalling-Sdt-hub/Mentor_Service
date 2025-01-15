import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/casess_network_image.dart';
import 'package:mentors_service/common/widgets/custom_card.dart';
import 'package:mentors_service/common/widgets/icon_and_text.dart';

class ForAllView extends StatelessWidget {
  const ForAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 6,
          child: GridView.builder(
            itemCount: 15,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: 230.h),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  Get.toNamed(Routes.SCHEDULE_DETAILS);
                },
                child: CustomCard(
                  cardWidth: 116,
                  elevation: 2,
                  cardColor: AppColors.scheduleCardColor,
                  borderSideColor: AppColors.scheduleCardColor,
                  children: [
                    CustomNetworkImage(
                      imageUrl: AppNetworkImage.golfPlayerImg,
                      boxShape: BoxShape.rectangle,
                      height: 92.h,
                      width: 91.w,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    Text('Shuvo Kh', style: AppStyles.h4()),
                    Spacer(),
                    IconText(
                      iconData: Icons.calendar_month_outlined,
                      text: 'Fri, 12 Sep',
                    ),
                    Spacer(),
                    IconText(
                      iconData: Icons.access_time_outlined,
                      text: '10:00 pm',
                    ),
                    Spacer(),
                    AppCustomTextOrIconButton(
                      text: 'Edit',
                      containerVerticalPadding: 0,
                      onTab: () {
                        Get.toNamed(Routes.ADD_SCHEDULE,
                            arguments: {'isEdit': true});
                      },
                      isIconWithTextActive: true,
                      iconPath: AppIcons.editLogo,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                    ),
                    Spacer(),
                  ],
                ),
              );
            },
          ),
        ),
        const Spacer(flex: 1,),
        Flexible(
          flex: 2,
          child: AppCustomTextOrIconButton(
            height: 50.h,
              iconHeight: 30.h,
              text: 'Add New Schedule',
              onTab: () {
              Get.toNamed(Routes.ADD_SCHEDULE,arguments: {'isEdit':true});
              },
              isIconWithTextActive: true,
             iconPath: AppIcons.addIcon,
          ),
        )
      ],
    );
  }
}
