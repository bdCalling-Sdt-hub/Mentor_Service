import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mentors_service/app/data/api_constants.dart';

import 'package:mentors_service/app/modules/bottom_menu/bottom_menu..dart';
import 'package:mentors_service/app/modules/home/controllers/all_schedule_controller.dart';
import 'package:mentors_service/app/modules/home/model/schedule_model.dart';
import 'package:mentors_service/app/modules/mentor_mentee_details/widgets/schedule_list.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/app/utils/user_service.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_constant/app_constant.dart';
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

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AllScheduleController _homeController = Get.put(AllScheduleController());
  final ScrollController _scrollController= ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((__) async {
      await UserService().fetchRole();
      await _homeController.fetchSchedule();
      print('==== UserRole -> ${UserService().userRole} <- =======');
    });
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !_homeController.isFetchingMore.value) {
        await _homeController.loadMorePage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    String? userRole= UserService().userRole;
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: BottomMenu(0, chooseMentorOrMentee: userRole=='mentor'? 'Mentee':'Mentor', scaffoldKey: scaffoldKey),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
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
                    /// Upcoming Schedule =====
                    TitleAndSeeAll(
                      title: 'Upcoming Schedule',
                      onTap: () {
                        Get.toNamed(Routes.SCHEDULE_LIST);
                      },
                    ),
                    Obx((){
                     List<ScheduleResults> scheduleResults = _homeController.scheduleModel.value.data?.attributes?.results??[];
                     if(_homeController.isLoadingClub.value){
                       return const Center(child: CircularProgressIndicator());
                     }
                     if(scheduleResults.isEmpty){
                      return  SizedBox(
                        height: 150.h,
                          child: Center(child: Text('--Schedule are not available--',style: AppStyles.h5(),)));
                     }
                      return SizedBox(
                        height: 220.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          itemCount: scheduleResults.length + (_homeController.isFetchingMore.value? 1:0),
                          shrinkWrap: true,
                          clipBehavior: Clip.hardEdge,
                          itemBuilder: (BuildContext context, int index) {
                            if(index == scheduleResults.length ){
                              return Padding(
                                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 16),
                                child: const Center(child: CircularProgressIndicator()),
                              );
                            }
                           final scheduleResultsIndex = scheduleResults[index];
                            return  InkWell(
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
                                  IconText(iconData: Icons.calendar_month_outlined,
                                    text: DateFormat('EEE,dd MM').format(scheduleResultsIndex.appointmentDate!),
                                    textStyle:  TextStyle(fontSize: 12.sp,color: Colors.grey),
                                  ), //Fri, 12 Sep
                                  const Spacer(),
                                  IconText(iconData: Icons.access_time_outlined,
                                    text: '${scheduleResultsIndex.appointmentTime}',
                                    textStyle:  TextStyle(fontSize: 12.sp,color: Colors.grey),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            );
                          },

                        ),
                      );
                    }

                    ),
                    ///My Mentor Or Mentee Request list ====
                    TitleAndSeeAll(
                      title: 'Mentor Request',
                      count: 5,
                      onTap: () {
                        Get.offAndToNamed(Routes.MENTOR_OR_MENTEES);
                      },
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
                      onTap: () {
                        Get.offAndToNamed(Routes.MENTOR_OR_MENTEES);
                      },
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




