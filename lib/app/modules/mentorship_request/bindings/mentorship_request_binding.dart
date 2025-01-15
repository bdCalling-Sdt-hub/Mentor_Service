import 'package:get/get.dart';

import '../controllers/mentorship_request_controller.dart';

class MentorshipRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentorshipRequestController>(
      () => MentorshipRequestController(),
    );
  }
}
