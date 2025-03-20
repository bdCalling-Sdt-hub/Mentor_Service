import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:mentors_service/app/modules/schedule_update/model/schedule_update_model.dart';
import 'package:mentors_service/app/modules/search/model/find_mentor_mentee_model.dart';
import 'package:mentors_service/common/prefs_helper/prefs_helpers.dart';

class FindMentorMenteeController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();
  List<String> branchList = ['Army', 'Navy', 'Air force', 'Coast Guard'];
  List<String> statusList = ['Active Duty', 'Reserve', 'Retired', 'N/A'];
  List<String> experienceLevelList = ['0-3 Years', '4-10 years', '10+ years'];
  String? branch;
  String? status;
  String? experienceLevel;

  RxList allItemList = [].obs;

  Rx<MentorMenteeFindModel> mentorMenteeFindModel = MentorMenteeFindModel().obs;
  RxBool isLoading2 = false.obs;

  fetchMentorMentee(String name,String role) async {
    isLoading2.value = true;
    try {
      String token = await PrefsHelper.getString('token');
      String userId = await PrefsHelper.getString('userId');


      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };


      var request = http.Request('GET', Uri.parse(ApiConstants.findMentorMenteeUrl(name,role)));

      request.headers.addAll(headers);
      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);
      print('Profile updated successfully: ${responseBody.body}');
      var decodedBody = jsonDecode(responseBody.body);
      if (response.statusCode == 200) {
        mentorMenteeFindModel.value = MentorMenteeFindModel.fromJson(decodedBody);
        print(mentorMenteeFindModel.value);
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
