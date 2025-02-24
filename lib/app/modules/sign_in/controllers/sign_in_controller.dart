import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:mentors_service/app/routes/app_pages.dart';
import 'package:mentors_service/common/prefs_helper/prefs_helpers.dart';

class SignInController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> login() async {

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    var body = {'email': emailCtrl.text.trim(), 'password': passCtrl.text};

    http.Request request = http.Request('POST', Uri.parse(ApiConstants.logInUrl));
    request.headers.addAll(headers);
    request.body = jsonEncode(body);

    try {

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);
      Map<String, dynamic> decodedData = jsonDecode(responseData.body);

      if (response.statusCode == 200) {
        print(decodedData);
        String accessToken = decodedData['data']['attributes']['tokens']['accessToken'];
        String userRole = decodedData['data']['attributes']['user']['role'];
        await PrefsHelper.setString('token', accessToken);
        await PrefsHelper.setString('userRole', userRole);
        String token = await PrefsHelper.getString('token');
        String role = await PrefsHelper.getString('userRole');
        print(token);
        print(role);
        Get.toNamed(Routes.HOME,);
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
      isLoading.value=false;
    }

  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.onClose();
  }
}
