import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'my_mentor_mentee_card.dart';

class MentorMenteeSuggestion extends StatelessWidget {
  const MentorMenteeSuggestion({super.key,});

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
            child: MyMentorMenteeCard(),
          );
        },
      );

  }
}
