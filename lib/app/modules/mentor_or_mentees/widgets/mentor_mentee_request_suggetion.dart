import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mentors_service/app/modules/mentor_or_mentees/widgets/mentor_mentee_request_card.dart';

import 'my_mentor_mentee_card.dart';

class MentorMenteeRequestSuggestion extends StatelessWidget {
  const MentorMenteeRequestSuggestion({super.key,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: MentorMenteeRequestCard(),
        );
      },
    );

  }
}
