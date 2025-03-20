import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show TextEditingController, showDatePicker;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:mentors_service/app/modules/home/controllers/all_schedule_controller.dart';
import 'package:mentors_service/common/prefs_helper/prefs_helpers.dart';

class AddScheduleController extends GetxController {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController hourController = TextEditingController(text: "06");
  final TextEditingController minuteController = TextEditingController(text: "00");
  final TextEditingController linkController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final AllScheduleController _allScheduleController = Get.find();
  List<String> linkTypeList=['Zoom', 'Google Meet', 'Teams link','Meeting location'];
  String selectedLinkType = "Zoom";
  RxBool isLoading =false.obs;

  void pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
        dateController.text = DateFormat('MM/dd/yyyy').format(pickedDate);
        update();
    }
  }

  /// Network Call Function
  createSchedule({Function(String?)? callBack,bool? isAm}) async {
    isLoading.value = true;
    try {
      String token = await PrefsHelper.getString('token');
      String userId = await PrefsHelper.getString('userId');

      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      Map<String, String> body = {
        "appointment_date": dateController.text,
        "appointment_time": "${hourController.text}:${minuteController.text} ${isAm == true?'AM':'PM'}",
        "type_of_link": selectedLinkType,
        "link": linkController.text,
        "scheduleType": "public",
        "description": descriptionController.text
      };

      var request = http.Request('POST', Uri.parse(ApiConstants.createScheduleUrl));

      request.headers.addAll(headers);
      // Check if an image is selected for upload
      request.body= jsonEncode(body);
      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);
      print('Profile updated successfully: ${responseBody.body}');
      var decodedBody = jsonDecode(responseBody.body);
      if (response.statusCode == 201) {
       await _allScheduleController.fetchSchedule();
        Get.snackbar('Success', decodedBody['message']);
      } else {
        print('Error: ${response.statusCode}');
        Get.snackbar('Failed', decodedBody['message']);
      }
    } on SocketException catch (_) {
      Get.snackbar(
        'Error',
        'No internet connection. Please check your network and try again.',
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
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
}
