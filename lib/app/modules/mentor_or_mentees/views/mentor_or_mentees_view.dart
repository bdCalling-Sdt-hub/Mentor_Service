import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/modules/bottom_menu/bottom_menu..dart';
import 'package:mentors_service/app/modules/mentor_or_mentees/controllers/search_mentor_mentee_controller.dart';
import 'package:mentors_service/app/modules/mentor_or_mentees/widgets/mentor_mentee_request_suggetion.dart';
import 'package:mentors_service/app/modules/mentor_or_mentees/widgets/mentor_mentee_suggetion.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/app/utils/user_service.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_drawer/app_drawer.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/custom_text_field.dart';
import 'package:mentors_service/common/widgets/notification_appbar.dart';

import '../controllers/mentor_or_mentees_controller.dart';

class MentorOrMenteesView extends StatefulWidget {
  const MentorOrMenteesView({super.key});

  @override
  State<MentorOrMenteesView> createState() => _MentorOrMenteesViewState();
}

class _MentorOrMenteesViewState extends State<MentorOrMenteesView> {
  final TextEditingController _searchCtrl = TextEditingController();
  final SearchMentorMenteeController _searchMentorMenteeController=Get.put(SearchMentorMenteeController());
  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    String? userRole= UserService().userRole;
    final List<String> tabBarList = [userRole=='mentor'? 'Mentee':'Mentor', "Request"];
    return Scaffold(
      key:scaffoldKey ,
      floatingActionButton: BottomMenu(1, chooseMentorOrMentee: userRole=='mentor'? 'Mentee':'Mentor', scaffoldKey: scaffoldKey),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      drawer: AppDrawer(),
      body: SafeArea(
        child: DefaultTabController(
          length: tabBarList.length,
          child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      /// Search Field
                      CustomTextField(
                        contentPaddingVertical: 15.h,
                        filColor: AppColors.primaryColor.withOpacity(0.1),
                        hintText: "Search".tr,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: SvgPicture.asset(
                            AppIcons.search_1Icon,
                            height: 24.h,
                            width: 24.w,
                            colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn) ,
                          ),
                        ),
                        controller: _searchCtrl,
                        onChange: (value)async{
                         /* if(value!=null){
                            await _searchFriendController.fetchUserList(value);
                            if(tabBarList[1].isNotEmpty){
                              await _groupSearchController.searchGroup(name: value);
                              _scrollController.addListener(() async {
                                if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !_groupSearchController.isFetchingMore.value) {
                                  await _groupSearchController.loadMoreGroupPost(value);
                                }
                              });
                            }

                          }*/
                        },
                      ),
                      SizedBox(height: 16.h),

                      /// Tab Bar
                      TabBar(
                        indicatorColor: AppColors.primaryColor,
                        dividerColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        labelStyle: AppStyles.customSize(
                          size: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                        unselectedLabelStyle: AppStyles.customSize(
                          size: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.subTextColor,
                        ),
                        tabs: [
                          for (String tab in tabBarList) Tab(text: tab.tr),
                        ],
                      ),

                      /// Tab Bar View
                      Expanded(
                        child: TabBarView(
                          children: [
                          MentorMenteeSuggestion(),

                          MentorMenteeRequestSuggestion()
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
