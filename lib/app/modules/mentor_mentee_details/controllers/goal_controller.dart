import 'package:get/get.dart';

class GoalController extends GetxController{
  RxList<RxBool> isCheckedList =<RxBool>[].obs;
  RxDouble progressValue=0.0.obs;
  RxInt taskCount = 0.obs;
  List<String> editDeleteList=['Edit','Delete'];
  List<String> seeAllList=['All','Create by you' ,'Create by mentor'];
  RxString editOrDeleteValue = ''.obs;
  RxString seeAllLValue = ''.obs;
  void initializeCheckBoxList(int taskCount){
    isCheckedList.value= List.generate(taskCount, (_)=> false.obs);
  }
}