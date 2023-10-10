import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';
import 'package:get/get.dart';

class TarefasController extends GetxController {
  //TODO: Implement TarefasController
  RxList<TalksModel> listtalks = RxList<TalksModel>([]);
  final count = 0.obs;
  @override
  void onInit()async {
    super.onInit();

     listtalks.value =  await RepositoryTalks.GetTalks();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
