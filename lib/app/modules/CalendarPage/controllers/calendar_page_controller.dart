
import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';
import 'package:get/get.dart';

class CalendarPageController extends GetxController {
  //TODO: Implement CalendarPageController
  RxList<TalksModel> listTalks = RxList<TalksModel>([]);
  TalksModel talksModel = TalksModel();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    GetTalks();
  }

 

  Future<void> GetTalks() async {
    listTalks.value = await RepositoryTalks.GetTalks();
  }

  void increment() => count.value++;
}
