import 'package:get/get.dart';

import '../controllers/schedule_details_controller.dart';

class ScheduleDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleDetailsController>(
      () => ScheduleDetailsController(),
    );
  }
}
