import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/app/modules/search/controllers/find_mentor_mentee_controller.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_string/app_string.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/text_required.dart';

import '../controllers/filter_controller.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  final FindMentorMenteeController _findMentorMenteeController =Get.put(FindMentorMenteeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarTitle(text: 'Filter'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Branch
              SizedBox(height: 15.h),
              TextRequired(
                text: 'Branch',
                textStyle: AppStyles.h4(family: "Schuyler"),
              ),
              SizedBox(height: 15.h),
              DropdownButtonFormField<String>(
                value: _findMentorMenteeController.branch,
                padding: EdgeInsets.zero,
                hint: const Text("Select Branch "),
                items: _findMentorMenteeController.branchList.map(
                      (branchValue) => DropdownMenuItem<String>(
                    value: branchValue,
                    child: Text(branchValue),
                  ),
                ).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Select Branch';
                  }
                  return null;
                },
                onChanged: (newValue) {
                  setState(() {
                    _findMentorMenteeController.branch = newValue??'';
                    _findMentorMenteeController.allItemList.removeWhere((item)=>_findMentorMenteeController.branchList.contains(item) );
                    _findMentorMenteeController.allItemList.add(_findMentorMenteeController.branch!);
                       print(_findMentorMenteeController.allItemList);
                    print('branch>>>${_findMentorMenteeController.branch}');
                  });
                },
              ),


              /// Status
              SizedBox(height: 15.h),
              TextRequired(
                text: 'Select Status',
                textStyle: AppStyles.h4(family: "Schuyler"),
              ),
              SizedBox(height: 15.h),
              Wrap(
                spacing: 8.w,
                children: _findMentorMenteeController.statusList.map((status){
                  return ChoiceChip(
                      label: Text(status),
                      selected: _findMentorMenteeController.status==status,
                     selectedColor: AppColors.primaryColor,
                    side: const BorderSide(color: AppColors.primaryColor),
                    showCheckmark : false,
                    onSelected: (onSelected){
                      setState(() {
                        _findMentorMenteeController.status = onSelected? status: null;
                        if(onSelected){
                          _findMentorMenteeController.allItemList.removeWhere((item)=>_findMentorMenteeController.statusList.contains(item) );
                          _findMentorMenteeController.allItemList.add(_findMentorMenteeController.status!);
                        }else{
                          _findMentorMenteeController.allItemList.remove(_findMentorMenteeController.status);
                        }
                      });
                      print(_findMentorMenteeController.allItemList);
                    },
                  );
                }).toList() ,
              ),

              /// Experience level
              SizedBox(height: 15.h),
              TextRequired(
                text: 'Select Experience level',
                textStyle: AppStyles.h4(family: "Schuyler"),
              ),
              SizedBox(height: 15.h),
              Wrap(
                spacing: 8.w,
                children: _findMentorMenteeController.experienceLevelList.map((status){
                  return ChoiceChip(
                    label: Text(status),
                    selected: _findMentorMenteeController.experienceLevel==status,
                    selectedColor: AppColors.primaryColor,
                    side: const BorderSide(color: AppColors.primaryColor),
                    showCheckmark : false,
                    onSelected: (onSelected){
                      setState(() {
                        _findMentorMenteeController.experienceLevel = onSelected? status: null;
                        if(onSelected){
                          _findMentorMenteeController.allItemList.removeWhere((item)=>_findMentorMenteeController.experienceLevelList.contains(item) );
                          _findMentorMenteeController.allItemList.add(_findMentorMenteeController.experienceLevel!);
                        }else{
                          _findMentorMenteeController.allItemList.remove(_findMentorMenteeController.experienceLevel);
                        }
                        print(_findMentorMenteeController.allItemList);
                      });
                    },
                  );
                }).toList() ,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
