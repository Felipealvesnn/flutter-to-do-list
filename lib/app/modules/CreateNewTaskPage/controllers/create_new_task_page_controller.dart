import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';
import 'package:get/get.dart';

class CreateNewTaskPageController extends GetxController {
  //TODO: Implement CreateNewTaskPageController
 TalksModel talksModel = TalksModel();
   RxList listTalks = [].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

     GetTalks();

  
  }

  @override
  void onReady() {
    super.onReady();
    //GetTalks();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> GetTalks() async {

    listTalks.value = await RepositoryTalks.GetTalks();
    print(listTalks);


  }

   Future<void> AddTalks() async {
    //talksModel.id = 2 ;
    talksModel.title = 'teste';
    talksModel.description = 'teste';
    talksModel.date = 'teste';
    talksModel.StartTime = 'teste';
    talksModel.EndTime = 'teste';
    talksModel.categoriaId = 1 ;
    await RepositoryTalks.AddTask(talksModel);
    
  }

  void increment() => count.value++;
}
