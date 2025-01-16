import 'package:flutter/material.dart';
import 'package:mentors_service/app/modules/notification/widgets/notification_tile.dart';
import 'package:mentors_service/common/widgets/custom_appBar_title.dart';



class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarTitle(text: 'Notification'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            NotificationTile(
              title: "Event",
              subtitle: "event name",
              date: "Dec 15",
              backgroundColor: Colors.lightBlue.shade50,
            ),
            NotificationTile(
              title: "Massage",
              subtitle: "i just sad, we may have a good...",
              date: "Dec 15",
              backgroundColor: Colors.white,
            ),
            NotificationTile(
              title: "Mentee request",
              subtitle: "see the mentee request",
              date: "Dec 15",
              backgroundColor: Colors.lightBlue.shade50,
            ),
            NotificationTile(
              title: "Next schedule",
              subtitle: "before 10 minute notify",
              date: "Dec 15",
              backgroundColor: Colors.orange.shade50,
            ),
          ],
        ),
      ),
    );
  }
}
