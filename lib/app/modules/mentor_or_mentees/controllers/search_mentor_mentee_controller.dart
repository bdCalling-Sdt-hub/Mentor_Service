import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:mentors_service/common/prefs_helper/prefs_helpers.dart';


class SearchMentorMenteeController extends GetxController {
 // Rx<UserModel> userModel=UserModel().obs;
  RxString errorMessage = ''.obs;
  RxBool isLoading = false.obs;

  fetchUserList(String name) async {
    try {
      isLoading.value=true;
      String token = await PrefsHelper.getString('token');
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse(ApiConstants.searchNameUrl(name)));
      request.headers.addAll(headers);
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      final responseData = jsonDecode(responseBody);
      if (response.statusCode == 200) {
        // userModel.value = UserModel.fromJson(responseData);
        // print(userModel.toString());
      } else {
        print('Error>>>');
        isLoading.value=false;
        errorMessage.value = 'Failed to load data';
      }
    } on Exception catch (error) {
      print(error.toString());
      isLoading.value=false;
      errorMessage.value = 'Something wen wrong';
    }
  }
}
