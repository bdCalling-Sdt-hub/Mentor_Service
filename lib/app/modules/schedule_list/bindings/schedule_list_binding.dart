import 'package:get/get.dart';

import '../controllers/schedule_list_controller.dart';

class ScheduleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleListController>(
      () => ScheduleListController(),
    );
  }
}
