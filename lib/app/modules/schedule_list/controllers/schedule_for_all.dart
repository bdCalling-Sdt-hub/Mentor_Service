import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:mentors_service/app/modules/home/model/schedule_model.dart';
import 'package:http/http.dart' as http;
import 'package:mentors_service/common/prefs_helper/prefs_helpers.dart';

class ScheduleForAllController extends GetxController{
  Rx<ScheduleModel> scheduleModel = ScheduleModel().obs;

  RxString errorMessage = ''.obs;
  RxBool isLoadingClub = false.obs;

  RxBool isFetchingMore = false.obs;
  RxInt currentPage = 1.obs;
  RxInt pageLimit = 4.obs;
  RxInt totalPages = 1.obs;


  fetchTodaySchedule( {bool isLoadMore = false }) async {
    if (isLoadMore && isFetchingMore.value) return;
    if (isLoadMore) {
      isFetchingMore.value = true;
    } else {
      isLoadingClub.value = true;
      currentPage.value = 1;
    }

    String token = await PrefsHelper.getString('token');
    String url = '${ApiConstants.todayScheduleUrl}?page=${currentPage.value}&limit=${pageLimit.value}';
    Map<String, String> headers = {'Authorization': 'Bearer $token'};

    try {

      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(headers);
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      final responseData = jsonDecode(responseBody);
      var dataList = (responseData['data']['attributes']['results'] as List<dynamic>);
      print(responseData);
      if (response.statusCode == 200) {
        if (isLoadMore) {
          scheduleModel.value.data?.attributes?.results ??= [];
          scheduleModel.value.data?.attributes?.results?.addAll(dataList.map((data) => ScheduleResults.fromJson(data)));
        } else {
          scheduleModel.value = ScheduleModel.fromJson(responseData);
        }
        print(scheduleModel.value);
        totalPages.value = responseData['data']['attributes']['totalPages'] ?? totalPages.value;
      } else {
        print('Error>>>');
        isLoadingClub.value = false;
        errorMessage.value = 'Failed to load data';
        Get.snackbar(
          'Error',
          errorMessage.value,
          snackPosition: SnackPosition.TOP,
        );
      }
    } on SocketException catch (_) {
      Get.snackbar(
        'Error',
        'No internet connection. Please check your network and try again.',
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      print('Catch Error: $e');
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again later.',
        snackPosition: SnackPosition.TOP,

      );
      print(e);
    } finally {
      if (isLoadMore) {
        isFetchingMore.value = false;
      } else {
        isLoadingClub.value = false;
      }
    }
  }

  loadMorePage() async {
    if (currentPage.value < totalPages.value && !isFetchingMore.value) {
      currentPage.value += 1;
      await fetchTodaySchedule(isLoadMore: true);
    }
  }
}

