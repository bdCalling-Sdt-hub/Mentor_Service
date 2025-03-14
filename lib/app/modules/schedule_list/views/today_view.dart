import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mentors_service/app/modules/home/model/schedule_model.dart';
import 'package:mentors_service/app/modules/schedule_list/controllers/schedule_list_controller.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/casess_network_image.dart';
import 'package:mentors_service/common/widgets/custom_card.dart';
import 'package:mentors_service/common/widgets/icon_and_text.dart';

class TodayView extends StatefulWidget {
  const TodayView({super.key});

  @override
  State<TodayView> createState() => _TodayViewState();
}

class _TodayViewState extends State<TodayView> {
  final ScheduleListController _scheduleListController = Get.put(ScheduleListController());
  final ScrollController _scrollController= ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((__)async{
      _scheduleListController.fetchTodaySchedule();
    });
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !_scheduleListController.isFetchingMore.value) {
        await _scheduleListController.loadMorePage();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Obx((){
      List<ScheduleResults> scheduleResult = _scheduleListController.scheduleModel.value.data?.attributes?.results??[];
      if(_scheduleListController.isLoadingClub.value){
        return const Center(child: CircularProgressIndicator());
      }else if(scheduleResult.isEmpty){
        return Text('Today schedule are not available',style: AppStyles.h5(),);
      }
      return  GridView.builder(
        itemCount: scheduleResult.length + (_scheduleListController.isFetchingMore.value?1:0),
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 230.h),
        itemBuilder: (BuildContext context, int index) {
          if(index == scheduleResult.length){
            return Padding(
              padding:  EdgeInsets.only(bottom: 16.h),
              child: const Center(child: CircularProgressIndicator()),
            );
          }
         final scheduleResultIndex = scheduleResult[index];
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
                /// Name
                Text('${scheduleResultIndex.creator?.firstName}', style: AppStyles.h4()),
                /// Date
                Spacer(),
                IconText(
                  iconData: Icons.calendar_month_outlined,
                  text: '${ DateFormat('EEE,dd MM').format(scheduleResultIndex.appointmentDate!)}',
                ),
                /// Time
                Spacer(),
                IconText(
                  iconData: Icons.access_time_outlined,
                  text: '${scheduleResultIndex.appointmentTime}',
                ),
                Spacer(),
                AppCustomTextOrIconButton(
                  text: 'Edit',
                  containerVerticalPadding: 0,
                  onTab: () {
                    Get.toNamed(Routes.ADD_SCHEDULE,arguments: {'isEdit':true});
                  },
                  isIconWithTextActive: true,
                  iconPath: AppIcons.editLogo,
                  textColor: Colors.white,
                  iconColor:  Colors.white,
                ),
                Spacer(),
              ],
            ),
          );
        },
      );
    }

    );
  }
}
