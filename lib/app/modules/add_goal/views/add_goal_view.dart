import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';

class AddGoalView extends StatefulWidget {
  const AddGoalView({super.key});

  @override
  State<AddGoalView> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<AddGoalView> {
  final TextEditingController addGoalCtrl = TextEditingController();
  final List<TextEditingController> taskControllers = [];

  @override
  void initState() {
    super.initState();
    taskControllers.add(TextEditingController()); // Add an initial task field
  }

  @override
  void dispose() {
    addGoalCtrl.dispose();
    for (var controller in taskControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void addTask() {
    setState(() {
      taskControllers.add(TextEditingController());
    });
  }

  void removeTask(int index) {
    setState(() {
      taskControllers.removeAt(index);
    });
  }

  void onDonePressed() {
    String goalName = addGoalCtrl.text.trim();
    List<String> tasks = taskControllers.map((value) => value.text.trim()).toList();

    // You can handle the submission logic here
    debugPrint('Goal Name: $goalName');
    debugPrint('Tasks: $tasks');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBarTitle(text: 'Create Goal'),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Name of Goal
            Text(
              'Name of Goal',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            TextField(
              controller: addGoalCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
              ),
            ),
            SizedBox(height: 16.h),

            /// Name of Task
            Text(
              'Name of Task',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),

            /// List of Task TextFields
            Expanded(
              child: ListView.builder(
                itemCount: taskControllers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.drag_indicator_outlined,
                          size: 24.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: TextField(
                            controller: taskControllers[index],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        IconButton(
                          onPressed: () {
                            removeTask(index);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 24.sp,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// Add New Task Button
            OutlinedButton.icon(
              onPressed: addTask,
              icon: const Icon(Icons.add, color: Colors.teal),
              label: Text(
                'Add new task',
                style: TextStyle(color: AppColors.primaryColor, fontSize: 16.sp),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                minimumSize: Size(double.infinity, 40.h),
                alignment: Alignment.center,
              ),
            ),

            /// Done Button
            SizedBox(height: 16.h),
            CustomButton(onTap: onDonePressed, text: 'Done')
          ],
        ),
      ),
    );
  }
}
