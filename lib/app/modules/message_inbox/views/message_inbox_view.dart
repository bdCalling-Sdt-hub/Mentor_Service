import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/message_inbox_controller.dart';

class MessageInboxView extends GetView<MessageInboxController> {
  const MessageInboxView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MessageInboxView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MessageInboxView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
