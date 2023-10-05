import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';
import 'package:get/get.dart';

class CreateNewTaskPageController extends GetxController {
  //TODO: Implement CreateNewTaskPageController
  final Rx<TalksModel> talksModel = TalksModel().obs;
   RxList listTalks = [].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

  
  }

  @override
  void onReady() {
    super.onReady();
    GetTalks();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> GetTalks() async {

    listTalks.value = await RepositoryTalks.GetTalks();


  }

  void increment() => count.value++;
}
