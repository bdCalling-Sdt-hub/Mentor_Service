import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mentors_service/app/modules/bottom_menu/bottom_menu..dart';
import 'package:mentors_service/app/modules/mentor_or_mentees/controllers/search_mentor_mentee_controller.dart';
import 'package:mentors_service/app/modules/search/controllers/find_mentor_mentee_controller.dart';
import 'package:mentors_service/app/modules/search/widgets/profile_summery_send_message.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_drawer/app_drawer.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/custom_card.dart';
import 'package:mentors_service/common/widgets/custom_search_field.dart';
import 'package:mentors_service/common/widgets/notification_appbar.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

class FindMentorMenteeView extends StatefulWidget {
  const FindMentorMenteeView({super.key});

  @override
  State<FindMentorMenteeView> createState() => _FindMentorMenteeViewState();
}

class _FindMentorMenteeViewState extends State<FindMentorMenteeView> {
  final FindMentorMenteeController _findMentorMenteeController =
      Get.put(FindMentorMenteeController());

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: BottomMenu(2, chooseMentorOrMentee: 'Mentee', scaffoldKey: scaffoldKey),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: NotificationAppBar(
                  messageOnTap: () {
                    Get.toNamed(Routes.MESSAGE);
                  },
                  notificationOnTap: () {
                    Get.toNamed(Routes.NOTIFICATION);
                  },
                  messageCount: 2,
                  notificationCount: 3,
                ),
              ),
              verticalSpacing(16.h),
              CustomSearchField(
                searchCtrl: _findMentorMenteeController.searchCtrl,
                onChanged: (value) {},
                fillColor: AppColors.primaryColor.withOpacity(0.1),
                suffixIcon: Icons.tune_outlined,
                iconOnTap: () {
                  Get.toNamed(Routes.FILTER);
                },
              ),
              verticalSpacing(5.h),
              Obx(() {
                return Row(
                  children: List.generate(
                    _findMentorMenteeController.allItemList.length,
                    (index) {
                      final itemIndex =
                          _findMentorMenteeController.allItemList[index];
                      return CustomCard(
                        padding: 5,
                        isRow: true,
                        borderRadius: 30.r,
                        elevation: 0,
                        borderSideColor: AppColors.primaryColor.withOpacity(0),
                        cardColor: AppColors.primaryColor.withOpacity(0.2),
                        children: [
                          Text(
                            itemIndex,
                            style: AppStyles.h5(),
                          ),
                          GestureDetector(
                            onTap: () {
                              _findMentorMenteeController.allItemList
                                  .removeAt(index);
                            },
                            child: Icon(
                              Icons.close,
                              size: 18.sp,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                );
              }),
              verticalSpacing(10.h),
              Text(
                'Mentees',
                style: AppStyles.h2(),
              ),
              verticalSpacing(10.h),
              Flexible(
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ProfileSummerySendMessage();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
