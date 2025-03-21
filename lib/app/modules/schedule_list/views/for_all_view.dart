import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mentors_service/app/data/api_constants.dart' show ApiConstants;
import 'package:mentors_service/app/modules/home/controllers/all_schedule_controller.dart';
import 'package:mentors_service/app/modules/home/model/schedule_model.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/app/utils/user_service.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/prefs_helper/prefs_helpers.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/casess_network_image.dart';
import 'package:mentors_service/common/widgets/custom_card.dart';
import 'package:mentors_service/common/widgets/icon_and_text.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

class ForAllView extends StatefulWidget {
   const ForAllView({super.key});

  @override
  State<ForAllView> createState() => _ForAllViewState();
}

class _ForAllViewState extends State<ForAllView> {
final AllScheduleController _allScheduleController=Get.find();
final ScrollController _scrollController= ScrollController();
// String? userRole;
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((__) async {
    // await getMyRole();
    await _allScheduleController.fetchSchedule();
  });
  _scrollController.addListener(() async {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !_allScheduleController.isFetchingMore.value) {
      await _allScheduleController.loadMorePage();
    }
  });
}

// getMyRole()async{
//   String role = await PrefsHelper.getString('userRole');
//   setState(() {
//     userRole = role;
//   });
// }

  @override
  Widget build(BuildContext context) {
  String? userRole = UserService().userRole;
  print(userRole);
    return Column(
      children: [
        Obx((){
          List<ScheduleResults> scheduleResults = _allScheduleController.scheduleModel.value.data?.attributes?.results??[];
          if(_allScheduleController.isLoadingClub.value){
            return  Center(
              heightFactor: 7.h,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ));
          }
          if(scheduleResults.isEmpty){
            return  SizedBox(
                height: 150.h,
                child: Center(child: Text('--Schedule are not available--',style: AppStyles.h5(),)));
          }
          return Flexible(
            flex: 6,
            child: GridView.builder(
                controller: _scrollController,
                itemCount: scheduleResults.length + (_allScheduleController.isFetchingMore.value? 1:0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisExtent: 230.h),
              itemBuilder: (BuildContext context, int index) {
                if(index == scheduleResults.length ){
                  return Padding(
                    padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 16),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                final scheduleResultsIndex = scheduleResults[index];
                return InkWell(
                  onTap: (){
                    Get.toNamed(Routes.SCHEDULE_DETAILS,arguments: {'scheduleResults': scheduleResultsIndex });
                  },
                  child: CustomCard(
                    cardWidth: 116,
                    elevation: 2,
                    cardColor: AppColors.scheduleCardColor,
                    borderSideColor: AppColors.scheduleCardColor,
                    children: [
                      CustomNetworkImage(
                        imageUrl: '${ApiConstants.imageBaseUrl}${scheduleResultsIndex.creator?.profileImage?.imageUrl}',
                        boxShape: BoxShape.rectangle,
                        height: 92.h,
                        width: 91.w,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      Text('${scheduleResultsIndex.creator?.firstName}', style: AppStyles.h4()),
                      const Spacer(),
                      IconText(
                        iconData: Icons.calendar_month_outlined,
                        text:  DateFormat('EEE,dd MM').format(scheduleResultsIndex.appointmentDate!),
                        textStyle:  const TextStyle(fontSize: 12,color: Colors.grey),
                      ),
                      const Spacer(),
                      IconText(
                        iconData: Icons.access_time_outlined,
                        text: '${scheduleResultsIndex.appointmentTime}',
                        textStyle: const TextStyle(fontSize: 12,color: Colors.grey),
                      ),
                      verticalSpacing(6.h),
                      if(userRole=='mentor')
                      AppCustomTextOrIconButton(
                        text: 'Edit',
                        containerVerticalPadding: 0,
                        onTab: () {
                          Get.toNamed(Routes.SCHEDULE_UPDATE, arguments: {'isEdit': true,'ScheduleId':scheduleResultsIndex.sId});
                        },
                        isIconWithTextActive: true,
                        iconPath: AppIcons.editLogo,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                      ),

                    ],
                  ),
                );
              },
            ),
          );
           }
        ),
        const Spacer(flex: 1,),
        if(userRole=='mentor')
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
