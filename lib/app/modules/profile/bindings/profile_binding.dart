import 'package:get/get.dart';
import 'package:mentors_service/app/modules/profile/controllers/profile_update_conreoller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );

    Get.lazyPut<ProfileUpdateController>(
      () => ProfileUpdateController(),
    );
  }
}
