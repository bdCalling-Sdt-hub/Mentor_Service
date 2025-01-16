import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mentors_service/app/modules/bottom_menu/bottom_menu..dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_drawer/app_drawer.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/casess_network_image.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_card.dart';
import 'package:mentors_service/common/widgets/event_card.dart';
import 'package:mentors_service/app/modules/mentor_or_mentees/widgets/mentor_mentee_request_card.dart';
import 'package:mentors_service/common/widgets/icon_and_text.dart';
import 'package:mentors_service/app/modules/home/widgets/my_mentor_mentee_home_card.dart';
import 'package:mentors_service/common/widgets/notification_appbar.dart';
import 'package:mentors_service/common/widgets/spacing.dart';
import 'package:mentors_service/common/widgets/title_and_seeAll.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: BottomMenu(0,
          chooseMentorOrMentee: 'Mentee', scaffoldKey: scaffoldKey),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.w),
                  child: NotificationAppBar(
                    messageOnTap: () {
                      Get.toNamed(Routes.MESSAGE);
                    },
                    notificationOnTap: () {
                      Get.toNamed(Routes.NOTIFICATION);
                    },
                    messageCount: 3,
                    notificationCount: 5,
                  ),
                ),

                Column(
                  children: [

                    ///Upcoming Schedule =====
                    TitleAndSeeAll(
                      title: 'Upcoming Schedule',
                      onTap: () {
                        Get.toNamed(Routes.SCHEDULE_LIST);
                      },
                    ),
                    SizedBox(
                      height: 220.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        shrinkWrap: true,
                        clipBehavior: Clip.hardEdge,
                        itemBuilder: (BuildContext context, int index) {
                          return  InkWell(
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
                                IconText(iconData: Icons.calendar_month_outlined, text: 'Fri, 12 Sep',),
                                Spacer(),
                                IconText(iconData: Icons.access_time_outlined, text: '10:00 pm',),
                                Spacer(),
                              ],
                            ),
                          );
                        },

                      ),
                    ),
                    ///My Mentor Or Mentee Request list ====
                    TitleAndSeeAll(
                      title: 'Mentor Request',
                      count: 5,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 180.h,
                      child: ListView.builder(
                        itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return MentorMenteeRequestCard();
                          },
                      ),
                    ),
                    ///My Mentor Or Mentee =====
                    TitleAndSeeAll(
                      title: 'My Mentor',
                      count: 3,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 190.h,
                      child: ListView.builder(
                        itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: MyMentorMenteeHomeCard(),
                            );
                          },
                      ),
                    ),

                    ///Event ===========
                    TitleAndSeeAll(
                      title: 'Event',
                      count: 2,
                      onTap: () {
                        Get.toNamed(Routes.EVENT_LIST);
                      },
                    ),
                  ],
                ),
                EventCard()

              ],
            ),
          ),
        ),
      ),
    );
  }
}




