import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_images/network_image%20.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_two_digits_formField.dart';
import 'package:mentors_service/common/widgets/profile_summery_card.dart';
import 'package:mentors_service/common/widgets/spacing.dart';
import 'package:mentors_service/common/widgets/text_required.dart';

class AddScheduleView extends StatefulWidget {
  const AddScheduleView({super.key});

  @override
  State<AddScheduleView> createState() => _AppointmentFormScreenState();
}

class _AppointmentFormScreenState extends State<AddScheduleView> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController hourController = TextEditingController(text: "06");
  final TextEditingController minuteController = TextEditingController(text: "00");
  final TextEditingController linkController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<String> linkTypeList=['Zoom', 'Google Meet', 'Teams link','Meeting location'];
  String selectedLinkType = "Zoom";
  bool isAM = true; // For AM/PM toggle
  bool isEdit=false;

  @override
  void initState() {
    if(Get.arguments != null){
      allArguments();
    }
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    hourController.dispose();
    minuteController.dispose();
    linkController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  allArguments(){
   bool edit= Get.arguments['isEdit']?? false;
    isEdit=edit;
  }

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        dateController.text = DateFormat('MM/dd/yyyy').format(pickedDate);
      });
    }
  }

  void onPublishPressed() {
    String date = dateController.text.trim();
    String hour = hourController.text.trim();
    String minute = minuteController.text.trim();
    String linkType = selectedLinkType;
    String link = linkController.text.trim();
    String description = descriptionController.text.trim();
    String amPm = isAM ? "AM" : "PM";

    // Handle your submission logic here
    debugPrint('Date: $date');
    debugPrint('Time: $hour:$minute $amPm');
    debugPrint('Type of Link: $linkType');
    debugPrint('Link: $link');
    debugPrint('Description: $description');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBarTitle(text: 'Schedule Appointment'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Note Section
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: [
                    Text(isEdit? AppString.addScheduleNote1Text:AppString.addScheduleNote2Text,
                      style: AppStyles.h5(color: Colors.blueAccent),
                    ),
                    /// profile summery
                    verticalSpacing(8.h),
                    if(!isEdit)
                      ProfileSummeryCard(
                        date: '12.12.25',
                        name: 'Shuvo Kh',
                        description: 'navy',
                        imageUrl: AppNetworkImage.golfPlayerImg,
                      ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              /// Appointment Date
              Text(
                'Appointment Date',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today_outlined),
                    onPressed: pickDate,
                  ),
                  hintText: 'MM/DD/YYYY',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                ),
              ),
              SizedBox(height: 16.h),

              /// Appointment Time
              Text(
                'Appointment Time',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  /// Hour Input
                  Expanded(
                    child: CustomTwoDigitsFormField(controller: hourController, digitValue: 12,),
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 6.w),
                    child: Text(
                      ':',
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  /// Minute Input
                  Expanded(
                    child: CustomTwoDigitsFormField(controller: minuteController, digitValue: 59,),
                  ),
                  SizedBox(width: 8.w),

                  /// AM/PM Toggle
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isAM = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: isAM ? AppColors.primaryColor : Colors.grey.shade300,
                          ),
                          child: Text(
                            'AM',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: isAM ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isAM = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: !isAM ? AppColors.primaryColor  : Colors.grey.shade300,
                          ),
                          child: Text(
                            'PM',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: !isAM ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              /// Type of Link
              TextRequired(
                text:'Type of link',
                textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              DropdownButtonFormField<String>(
                value: selectedLinkType,
                items: linkTypeList.map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLinkType = value!;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                ),
              ),
              SizedBox(height: 16.h),

              /// Link
              TextRequired(text: 'Link',
                textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
              SizedBox(height: 8.h),
              TextField(
                controller: linkController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.link),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                ),
              ),
              SizedBox(height: 16.h),

              /// Description
              Text(
                'Description (optional)',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                ),
              ),
              SizedBox(height: 16.h),
              /// Publish Button
              CustomButton(onTap: (){}, text: 'Publish'),
              verticalSpacing(16.h),
            ],
          ),
        ),
      ),
    );
  }
}




