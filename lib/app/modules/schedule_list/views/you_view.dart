import 'package:flutter/material.dart';

import 'package:mentors_service/app/modules/schedule_list/widgets/your_schedule_card.dart';

class YouView extends StatelessWidget {
  const YouView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return YourScheduleCard();
        },
    );
  }
}
