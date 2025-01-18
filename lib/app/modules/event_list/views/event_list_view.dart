import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';
import 'package:mentors_service/common/widgets/event_card.dart';

import '../controllers/event_list_controller.dart';

class EventListView extends StatelessWidget {
  const EventListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarTitle(text: 'Events'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return EventCard();
          },
        ),
      ),
    );
  }
}
