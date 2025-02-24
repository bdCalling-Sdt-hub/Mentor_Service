import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mentors_service/app/routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  var isLoading = false.obs; // Observable loading state

  Future<void> sendMail(bool? isResetPass) async {
    if (emailCtrl.text.isEmpty) {
      print("Email is required");
      return;
    }

    if (isLoading.value) {
      return; // Prevent multiple taps
    }

    isLoading.value = true;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      'email': emailCtrl.text.trim(),
    };

    print('Request URL: ${ApiConstants.emailSendUrl}');
    print('Request Headers: ${headers.toString()}');
    print('Request Body: ${jsonEncode(body)}');

    try {
      final url = Uri.parse(ApiConstants.emailSendUrl);
      final request = http.Request('POST', url)
        ..headers.addAll(headers)
        ..body = jsonEncode(body);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Response Data: $responseData');
       String resetToken = responseData['data']['attributes']['resetPasswordToken'];
        Get.snackbar(responseData['message'], '');
        Get.toNamed(Routes.OTP, arguments: {'email': emailCtrl.text, 'isResetPass': isResetPass ?? false,'verificationToken': resetToken });
      } else {
        print('Error: ${response.statusCode}, Message: ${response.body}');
        Get.snackbar(responseData['message'], '');
      }
    } on SocketException catch (_) {
      Get.snackbar(
        'Error',
        'No internet connection. Please check your network and try again.',
        snackPosition: SnackPosition.TOP,
      );
    }catch(e){
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again later.',
        snackPosition: SnackPosition.TOP,
      );
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    super.onClose();
  }
}
