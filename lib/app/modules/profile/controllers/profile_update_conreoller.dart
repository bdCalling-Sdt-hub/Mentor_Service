import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentors_service/app/data/api_constants.dart';
import 'package:mentors_service/common/prefs_helper/prefs_helpers.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

class ProfileUpdateController extends GetxController {
  final TextEditingController firstNameCtrl = TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final TextEditingController instagramNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();
  final TextEditingController whatTypeOfMentorCtrl = TextEditingController();
  final TextEditingController whatTypeOfMenteeCtrl = TextEditingController();

  List branchList = ['Army', 'Navy', 'Air Force','Coast Guard'];
  List currentStatusList = ['Active duty', 'Reserve', 'Retired', 'N/A'];
  List profileVisibilityList = ['Visible', 'Hide',];
  List matchedInInstagramList = ['Yes', 'No'];
  String? branch;
  String? currentStatus;
  String? profileVisibility;
  String? matchedInInstagram;
  RxString role='Mentee'.obs;
  RxBool isChecked=false.obs;
  RxBool isVisibleChecked=true.obs;
  RxBool isHideChecked=false.obs;
  File? selectedProfileImage;
  var profileImagePath = ''.obs;



  ///For Profile Pic
  Future<void> pickImageFromCameraForProfilePic(ImageSource source) async {
    final returnImage = await ImagePicker().pickImage(source: source);

    if (returnImage == null) return;

    selectedProfileImage = File(returnImage.path);
    profileImagePath.value = selectedProfileImage!.path;

    update(); // Updates the UI
    print('ImagePath: ${profileImagePath.value}');
    Get.back(); // Dismiss the image picker dialog
  }

  var registerLoading = false.obs;

  Future<void> updateProfile() async {
    try {
      registerLoading.value = true;
      String token = await PrefsHelper.getString('token');
      String authorId = await PrefsHelper.getString('authorId');

      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data'
      };

      Map<String, String> body = {
        'role': 'user',
        'phoneNumber': '',
        'dataOfBirth': '',
        'gender': '',
      };

      // Create a MultipartRequest for the profile update
      var request = http.MultipartRequest('PATCH', Uri.parse(ApiConstants.updateProfileUrl(authorId)));

      request.headers.addAll(headers);
      request.fields.addAll(body);

      // Check if an image is selected for upload
      buildImageForUpload(selectedProfileImage, request);

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await http.Response.fromStream(response);
        print('Profile updated successfully: ${responseBody.body}');
        var decodedBody = jsonDecode(responseBody.body);
        Get.showSnackbar(GetSnackBar(
          message: decodedBody['message'].toString(),
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          maxWidth: 330.w,
          borderRadius: 15,
        ));
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception in updating profile: $e');
      registerLoading(false);
    } finally {
      registerLoading.value = false;
    }
  }

  buildImageForUpload(File? selectedImage,http.MultipartRequest request){
    if (selectedImage != null) {
      final mimeType = lookupMimeType(selectedImage.path) ?? 'image/jpeg';
      final mimeTypeData = mimeType.split('/');

      request.files.add(http.MultipartFile(
        'image', // This should match your API's expected file key
        selectedImage.readAsBytes().asStream(),
        selectedImage.lengthSync(),
        filename: selectedImage.path.split('/').last,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
      ),
      );
    }
  }
}
