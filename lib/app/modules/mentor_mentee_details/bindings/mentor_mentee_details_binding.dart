import 'package:get/get.dart';

import '../controllers/mentor_mentee_details_controller.dart';

class MentorMenteeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentorMenteeDetailsController>(
      () => MentorMenteeDetailsController(),
    );
  }
}
