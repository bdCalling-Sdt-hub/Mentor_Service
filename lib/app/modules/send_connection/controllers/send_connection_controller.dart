import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:http/http.dart' as http;
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:mentors_service/common/prefs_helper/prefs_helpers.dart';

class SendConnectionController extends GetxController {

  TextEditingController messageCtrl = TextEditingController();

  RxBool isLoading2 = false.obs;

  sendConnection(String receiverId,String message,Callback callback) async {
    isLoading2.value = true;
    try {
      String token = await PrefsHelper.getString('token');
      String userId = await PrefsHelper.getString('userId');


      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      Map<String, String> body = {
        "receiverId": receiverId,
        "connectionMessage": message
      };
      var request = http.Request('POST', Uri.parse(ApiConstants.sendConnectionUrl));

      request.headers.addAll(headers);
      request.body= jsonEncode(body);
      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);
      print('Profile updated successfully: ${responseBody.body}');
      var decodedBody = jsonDecode(responseBody.body);
      if (response.statusCode == 201) {
        Get.snackbar('Success', decodedBody['message']);
        callback();
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
}
