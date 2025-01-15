import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
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
}
