import 'package:get/get.dart';
import 'package:mentors_service/app/modules/home/controllers/all_schedule_controller.dart';

import '../controllers/add_schedule_controller.dart';

class AddScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddScheduleController>(
      () => AddScheduleController(),
    );

    Get.lazyPut<AllScheduleController>(
      () => AllScheduleController(),
    );
  }
}
