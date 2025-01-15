import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mentors_service/app/modules/mentor_mentee_details/widgets/schedule_card.dart';

import 'goal_card.dart';


class GoalList extends StatefulWidget {
  const GoalList({super.key,});

  @override
  State<GoalList> createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Wrap ListView in Expanded
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return GoalCard();
            },
          ),
        ),
      ],
    );

  }
}
