import 'package:get/get.dart';

import '../controllers/schedule_update_controller.dart';

class ScheduleUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleUpdateController>(
      () => ScheduleUpdateController(),
    );
  }
}
