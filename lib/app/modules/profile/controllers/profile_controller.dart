import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  RxString role='Mentee'.obs;
  RxBool isChecked=false.obs;
  RxBool isVisibleChecked=true.obs;
  RxBool isHideChecked=false.obs;
}
