import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FindMentorMenteeController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();
  List<String> branchList=['Army','Navy','Air force','Coast Guard'];
  List<String> statusList=['Active Duty','Reserve','Retired','N/A'];
  List<String> experienceLevelList=['0-3 Years','4-10 years','10+ years'];
  String? branch;
  String? status;
  String? experienceLevel;

  RxList allItemList=[].obs;
}
