import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:mentors_service/app/routes/app_pages.dart';

class SignUpController extends GetxController {

  final TextEditingController firstNameCtrl = TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final TextEditingController instagramNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();
  final TextEditingController whatTypeOfMentorCtrl = TextEditingController();
  final TextEditingController whatTypeOfMenteeCtrl = TextEditingController();

  List branchList = ['Army', 'Navy', 'Air Force','Coast Guard'];
  List currentStatusList = ['Active Duty', 'Reserve', 'Retired'];
  List profileVisibilityList = ['visible', 'hidden',];
  List matchedInInstagramList = ['Yes', 'No'];

  String? branch;
  String? currentStatus;
  String? profileVisibility;
  String? matchedInInstagram;
  RxString role='mentee'.obs;
  RxBool isChecked=false.obs;
  RxBool isMenteeChecked=true.obs;
  RxBool isMentorChecked=false.obs;

  var registerLoading = false.obs;

  signUp() async {
    registerLoading.value=true;

    final header = {'Content-Type': 'application/json'};

    Map<String, String> body = {
      "first_name": firstNameCtrl.text,
      "last_name": lastNameCtrl.text,
      "email": emailCtrl.text,
      "password": passwordCtrl.text,
      "branch": branch??'',
      "current_status": currentStatus??'',
      "visibility": profileVisibility??'',
      "instagram":instagramNameCtrl.text,
      "matched_with_instagram": matchedInInstagram == 'Yes' ? true.toString() : false.toString(),
      "description": role.value == 'mentee'? whatTypeOfMenteeCtrl.text : whatTypeOfMentorCtrl.text,
      "role": role.value
    };

    http.Request request = http.Request('POST', Uri.parse(ApiConstants.registerUrl));
    request.headers.addAll(header);
    request.body = jsonEncode(body);

    try {

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);
      Map<String, dynamic> decodedData = jsonDecode(responseData.body);

      if (response.statusCode == 201) {
        String verificationToken = decodedData['data']['attributes']['verificationToken'];
        print(decodedData);
        Get.snackbar('Success', decodedData['message']);
          Get.toNamed(Routes.OTP,arguments: {'email':emailCtrl.text,'verificationToken': verificationToken});
      } else {
        print('Error>>>' );
        print('Error>>>${response}');
        Get.snackbar('Failed', decodedData['message']);
      }
    } on SocketException catch (_) {
      Get.snackbar(
        'Error',
        'No internet connection. Please check your network and try again.',
        snackPosition: SnackPosition.TOP,
      );
    }catch(_){
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again later.',
        snackPosition: SnackPosition.TOP,
      );
    }finally{
      registerLoading.value=false;
    }
  }

}
