import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/models/category.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';
import 'package:get/get.dart';

class CreateNewTaskPageController extends GetxController {
  //TODO: Implement CreateNewTaskPageController
  TalksModel talksModel = TalksModel();
  RxList<Category> categoryList = RxList<Category>([]);
  Rx<Category> categorySelecionada = Category().obs;

  RxList listTalks = [].obs;
  final count = 0.obs;

  Rx<TextEditingController> controllerCalendar = TextEditingController().obs;
  Rx<TextEditingController> controllerStart = TextEditingController().obs;
  Rx<TextEditingController> controllerEnd = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    categorySelecionada.value = Category(id: 1);
    GetCategorys();

    // GetTalks();
  }

  Future<void> GetTalks() async {
    listTalks.value = await RepositoryTalks.GetTalks();
    print(listTalks);
  }

  Future<void> GetCategorys() async {
    categoryList.value = await RepositoryTalks.GetCategorys();
    print(categoryList.value);
  }

  Future<void> AddTalks() async {
    talksModel.categoriaId = categorySelecionada.value.id;
    try {
      await RepositoryTalks.AddTask(talksModel);
      resetModeltal();
      Get.snackbar(
        "Sucesso",
        "Os dados foram salvos com sucesso!",
        duration: const Duration(seconds: 2), // Define a duração da mensagem
      );
    } catch (e) {
      print(e);
    }
  }

  resetModeltal() {
    talksModel = TalksModel();
     controllerCalendar..value.clear();
     controllerStart.value.clear();
     controllerEnd.value.clear();
  }
}
