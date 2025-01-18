import 'package:get/get.dart';

import '../controllers/send_connection_controller.dart';

class SendConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendConnectionController>(
      () => SendConnectionController(),
    );
  }
}
