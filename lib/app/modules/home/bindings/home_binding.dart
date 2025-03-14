import 'package:get/get.dart';

import '../controllers/all_schedule_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllScheduleController>(
      () => AllScheduleController(),
    );
  }
}
