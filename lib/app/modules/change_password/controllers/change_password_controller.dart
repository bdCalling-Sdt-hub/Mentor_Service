import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentors_service/app/data/api_constants.dart';

class ChangePasswordController extends GetxController {
  TextEditingController newPassCtrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();

  RxBool isLoading =false.obs;

  Future<void> resetPassword({required Function() function}) async {
    isLoading.value = true;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    String email= Get.arguments['email'];
    var body = {
      'email':email ,
      'password': confirmPassCtrl.text
    };

    try {

      var response = await http.post(Uri.parse(ApiConstants.resetPasswordUrl), body:  jsonEncode(body),headers: headers);
      final responseData = jsonDecode( response.body);

      if (response.statusCode == 200) {
        function();
        print(responseData.toString());

      } else {
        print('Error>>>');
        print('Error>>>${response.body}');
      }
    }on SocketException catch (_) {
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

 /* @override
  void onClose() {
    newPassCtrl.clear();
    confirmPassCtrl.clear();
    super.onClose();
  }*/
}
