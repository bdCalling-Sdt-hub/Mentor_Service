import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:mentors_service/app/modules/home/model/schedule_model.dart';
import 'package:mentors_service/app/modules/schedule_update/model/schedule_update_model.dart';
import 'package:mentors_service/common/prefs_helper/prefs_helpers.dart';

class ScheduleUpdateController extends GetxController {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  RxList<String> linkTypeList=['Zoom', 'Google Meet', 'Teams link','Meeting location'].obs;
  RxString? selectedLinkType= ''.obs;
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
  updateSchedule({bool? isAm}) async {
    isLoading.value = true;
    try {
      String token = await PrefsHelper.getString('token');

      String scheduleId = Get.arguments['ScheduleId'];

      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      Map<String, String> body = {
        "appointment_date": dateController.text,
        "appointment_time": "${hourController.text}:${minuteController.text} ${isAm == true?'AM':'PM'}",
        "type_of_link": selectedLinkType?.value??'Zoom',
        "link": linkController.text,
        "scheduleType": "public",
        "description": descriptionController.text
      };

      var request = http.Request('PATCH', Uri.parse(ApiConstants.scheduleUpdateUrl(scheduleId)));

      request.headers.addAll(headers);
      // Check if an image is selected for upload
      request.body= jsonEncode(body);
      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);
      print('Profile updated successfully: ${responseBody.body}');
      var decodedBody = jsonDecode(responseBody.body);
      if (response.statusCode == 200) {
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

  ///========================= Break ===============================
  /// Network Call Function
   Rx<ScheduleUpdateModel> scheduleUpdateModel = ScheduleUpdateModel().obs;
  RxBool isLoading2 =false.obs;
  fetchSchedule() async {
    isLoading2.value = true;
    try {
      String token = await PrefsHelper.getString('token');
      String userId = await PrefsHelper.getString('userId');

      String scheduleId = Get.arguments['ScheduleId'];

      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };


      var request = http.Request('GET', Uri.parse(ApiConstants.scheduleGetUrl(scheduleId)));

      request.headers.addAll(headers);
      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);
      print('Profile updated successfully: ${responseBody.body}');
      var decodedBody = jsonDecode(responseBody.body);
      if (response.statusCode == 200) {
        scheduleUpdateModel.value= ScheduleUpdateModel.fromJson(decodedBody);
        print(scheduleUpdateModel.value);
        showScheduleData();
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
      isLoading2.value = false;
    }
  }

  showScheduleData(){
    String date = DateFormat("dd-MM-yyyy").format(scheduleUpdateModel.value.data?.attributes!.appointmentDate??DateTime.now());
     dateController.text = date;
     hourController.text = scheduleUpdateModel.value.data?.attributes?.appointmentTime?.substring(0,2)??'';
     minuteController.text = scheduleUpdateModel.value.data?.attributes?.appointmentTime?.substring(3,5)??'';
     linkController.text = scheduleUpdateModel.value.data?.attributes?.link??'';
     descriptionController.text = scheduleUpdateModel.value.data?.attributes?.description??'';
     selectedLinkType?.value = scheduleUpdateModel.value.data?.attributes?.typeOfLink??'';
  }

@override
  void onReady() async{
    await fetchSchedule();
    super.onReady();
  }
}
