import 'package:get/get.dart';

import '../controllers/mentor_or_mentees_controller.dart';

class MentorOrMenteesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentorOrMenteesController>(
      () => MentorOrMenteesController(),
    );
  }
}
