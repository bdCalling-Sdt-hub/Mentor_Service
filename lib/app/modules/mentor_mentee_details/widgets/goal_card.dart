import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mentors_service/app/modules/mentor_mentee_details/controllers/goal_controller.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_icons/app_icons.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/app_custom_textOrIcon_button.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_card.dart';
import 'package:mentors_service/common/widgets/icon_and_text.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

import '../../../../common/widgets/rich_text.dart';
import 'check_element.dart';

class GoalCard extends StatefulWidget {
  const GoalCard({super.key});

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  final GoalController _goalController = Get.put(GoalController());
 final GlobalKey buttonKey = GlobalKey();

  Map<String, dynamic> taskDetail = {
    'data': [
      {'task': 'Push-up'},
      {'task': 'Long Run'},
      {'task': 'Chin-up'},
      {'task': 'Shooting Ak-47'},
    ]
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _goalController.initializeCheckBoxList((taskDetail['data'] as List).length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Separate Button
        verticalSpacing(6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// See All button
            InkWell(
              key: buttonKey,
              onTap: () {
                buildPopUpMenu(buttonKey, _goalController.seeAllList);
              },
              child: CustomCard(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                borderSideColor: Colors.black,
                cardWidth: 150.w,
                elevation: 2,
                isRow: true,
                children: [
                  Icon(Icons.filter_list_outlined),
                  Text('See all'),
                  Icon(Icons.arrow_drop_down_circle_outlined),
                ],
              ),
            ),
            /// Add Goal Button
            CustomButton(
              width: 100.w,
                onTap: (){
                  Get.toNamed(Routes.ADD_GOAL);
            }, text: '+ Add Goal')
          ],
        ),
        SizedBox(height: 8.h),

        // Main ListView containing multiple CustomCards
        Expanded(
          child: ListView.builder(
            itemCount: 3, // Number of CustomCards you want
            itemBuilder: (BuildContext context, int cardIndex) {
              GlobalKey buttonKey = GlobalKey();
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Obx((){
                  if (_goalController.progressValue.value ==null ||
                      _goalController.taskCount.value == null) {
                    return const Center(
                      child: CircularProgressIndicator(), // Show a loader or placeholder
                    );
                  }
                  return  CustomCard(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Mentor created',
                            style: AppStyles.h4(color: Colors.grey),
                          ),
                          horizontalSpacing(105.w),
                          Expanded(
                            child: IconText(
                              iconData: Icons.calendar_month_outlined,
                              text: '12-12-24',
                              textStyle: AppStyles.h5(color: Colors.grey.shade700),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 280.w,
                            child: CustomRichText(
                              text1: 'Goal $cardIndex :',
                              textStyle1: AppStyles.h3(),
                              text2: ' Develop Leadership Skills sdfdsfdsfds ',
                              textStyle2: AppStyles.h4(color: Colors.grey),
                            ),
                          ),
                          InkWell(
                            key: buttonKey,
                            onTap: () {
                              buildPopUpMenu(buttonKey, _goalController.editDeleteList);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: SvgPicture.asset(
                                AppIcons.threeDotIcon,
                                colorFilter: const ColorFilter.mode(
                                  Colors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      CustomRichText(
                        text1: '${(_goalController.progressValue.value * 100).toInt()}%',
                        textStyle1: AppStyles.h2(),
                        text2: ' Overall Progress',
                        textStyle2: AppStyles.h2(color: Colors.grey),
                      ),
                      SizedBox(height: 8.h),
                      LinearProgressIndicator(
                        color: AppColors.primaryColor,
                        backgroundColor: AppColors.grayLight,
                        value: _goalController.progressValue.value,
                        minHeight: 30.h,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      SizedBox(height: 8.h),
                      CustomRichText(
                        text1: 'Task :',
                        textStyle1: AppStyles.h2(),
                        text2:
                        ' ${_goalController.taskCount.value}/${(taskDetail['data'] as List).length}',
                        textStyle2: AppStyles.h3(color: Colors.grey),
                      ),
                      SizedBox(height: 15.h),

                      // Inner ListView for taskDetail
                      ListView.builder(
                        itemCount: (taskDetail['data'] as List).length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          int taskLength = (taskDetail['data'] as List).length;
                          final taskData = (taskDetail['data'] as List)[index];
                          return CheckBoxElement(
                            goalController: _goalController,
                            taskTitle: taskData['task'],
                            progressValue: (1 / taskLength),
                            index: index,
                          );
                        },
                      ),
                    ],
                  );
                }

                ),
              );
            },
          ),
        ),

      ],
    );
  }

  void buildPopUpMenu(GlobalKey buttonKey, List<dynamic> itemList) {
    WidgetsBinding.instance.addPostFrameCallback((__) {
      RenderBox currentRenderObject =
      buttonKey.currentContext?.findRenderObject() as RenderBox;
      final buttonPosition = currentRenderObject.localToGlobal(Offset.zero);
      showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
          buttonPosition.dx.w,
          buttonPosition.dy.h + 50.h,
          30.w,
          0,
        ),
        items: itemList.map(
              (item) => PopupMenuItem(
            child: Text(item),
            onTap: () {
              Text(item);
            },
          ),
        ).toList(),
      );
    });
  }
}
