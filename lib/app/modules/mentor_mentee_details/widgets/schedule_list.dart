import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mentors_service/app/modules/mentor_mentee_details/widgets/schedule_card.dart';


class ScheduleList extends StatelessWidget {
  const ScheduleList({super.key,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: ScheduleCard(),
        );
      },
    );

  }
}
