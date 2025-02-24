import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mentors_service/app/modules/mentor_mentee_details/controllers/goal_controller.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_text_style/style.dart';

class CheckBoxElement extends StatelessWidget {
  const CheckBoxElement({
    super.key,
    required GoalController goalController,
    this.taskTitle,
    this.progressValue,
    required this.index,
  }) : _goalController = goalController;

  final GoalController _goalController;
  final String? taskTitle;
  final double? progressValue;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(taskTitle ?? '', style: AppStyles.h4(),),
        Obx(() {
          return Checkbox(
              activeColor: AppColors.primaryColor,
              value: _goalController.isCheckedList[index].value,
              onChanged: (value) {
                _goalController.isCheckedList[index].value = value!;
                if (value) {
                  _goalController.progressValue.value += progressValue ?? 0.0;
                  _goalController.taskCount.value++;
                } else if (!value) {
                  _goalController.progressValue.value -= progressValue ?? 0.0;
                  _goalController.taskCount.value--;
                }
              });
        })
      ],
    );
  }
}
