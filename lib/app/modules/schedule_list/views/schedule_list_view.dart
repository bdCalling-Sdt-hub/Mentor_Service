import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/modules/schedule_list/views/for_all_view.dart';
import 'package:mentors_service/app/modules/schedule_list/views/today_view.dart';
import 'package:mentors_service/app/modules/schedule_list/views/you_view.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';

import '../controllers/schedule_list_controller.dart';

class ScheduleListView extends StatefulWidget {
   const ScheduleListView({super.key});

  @override
  State<ScheduleListView> createState() => _ScheduleListViewState();
}

class _ScheduleListViewState extends State<ScheduleListView> {
  final List<String> mentorTabBarList=['Today','For All'];
  final List<String> menteeTabBarList=['Today','For You','For All'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarTitle(text: 'Schedule List'),
      body: SafeArea(
        child: DefaultTabController(
            length: menteeTabBarList.length,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),

                  /// Tab Bar
                  TabBar(
                    indicatorColor: AppColors.primaryColor,
                    dividerColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    labelStyle: AppStyles.customSize(
                      size: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor,
                    ),
                    unselectedLabelStyle: AppStyles.customSize(
                      size: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.subTextColor,
                    ),
                    tabs: [
                      for (String tab in menteeTabBarList) Tab(text: tab.tr),
                    ],
                  ),

                  /// Tab Bar View
                  Expanded(
                    child: TabBarView(
                      children: [
                        TodayView(),
                        YouView(),
                        ForAllView()

                      ],
                    ),
                  ),

                ],
              ),
            )

        ),
      ),
    );
  }
}
