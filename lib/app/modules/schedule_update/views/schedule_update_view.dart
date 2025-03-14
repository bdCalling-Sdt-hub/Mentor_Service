import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/schedule_update_controller.dart';

class ScheduleUpdateView extends GetView<ScheduleUpdateController> {
  const ScheduleUpdateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScheduleUpdateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ScheduleUpdateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
