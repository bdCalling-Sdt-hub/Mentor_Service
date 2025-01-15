import 'package:get/get.dart';

import '../controllers/find_mentor_mentee_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindMentorMenteeController>(
      () => FindMentorMenteeController(),
    );
  }
}
