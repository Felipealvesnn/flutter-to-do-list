import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/models/category.dart';
import 'package:flutter_to_do_list/app/modules/CalendarPage/controllers/calendar_page_controller.dart';
import 'package:get/get.dart';

import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';

class TarefasController extends GetxController {

  TalksModel talksModel = TalksModel.withRandomColor();
  RxList<Category> categoryList = RxList<Category>([]);
  RxList<TalksModel> listtalks = RxList<TalksModel>([]);
  Rx<TextEditingController> controllerCalendar = TextEditingController().obs;
  Rx<TextEditingController> controllerStart = TextEditingController().obs;
  Rx<TextEditingController> controllerEnd = TextEditingController().obs;
  Rx<Category> categorySelecionada = Category().obs;

  Rx<FilterModel> filterModel = FilterModel().obs;
  List<TalksModel> listtalksAll = [];
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    GetCategorys();
    categorySelecionada.value = Category(id: 1);
    atualizar();
  }

  Future<void> GetCategorys() async {
    categoryList.value = await RepositoryTalks.GetCategorys();
  }

  Future<void> deleteTalk(TalksModel talksModel) async {
    await RepositoryTalks.deteleTalk(talksModel);
    atualizar();
  }

  Future<void> atualizar() async {
    listtalks.value = await RepositoryTalks.GetTalks();
    listtalksAll = listtalks.value;
  }

  Future<void> editarTal() async {
    talksModel.categoriaId = categorySelecionada.value.id;
    try {
      await RepositoryTalks.AddTask(talksModel);
      homeController.GetTalksQtd();

      Get.snackbar(
        "Sucesso",
        "Os dados foram salvos com sucesso!",
        duration: const Duration(seconds: 3), // Define a duração da mensagem
      );
      resetModeltal();
    } catch (e) {
      print(e);
    }
  }

  Future<void> PreencherCampos(
      TalksModel talksModel, BuildContext context) async {
    TimeOfDay startTime = TimeOfDay.fromDateTime(talksModel.StartTime!);
    TimeOfDay endTime = TimeOfDay.fromDateTime(talksModel.EndTime!);
    controllerCalendar.value.text = talksModel.date.toString().split(' ')[0];

    controllerStart.value.text = startTime.format(context);
    controllerEnd.value.text = endTime.format(context);
    categorySelecionada.value.id = talksModel.categoriaId!;
  }

  void filterTalskList() {
    bool conditionMet = false;

    if (filterModel.value.title!.isNotEmpty) {
      listtalks.value = listtalksAll
          .where((element) =>
              element.title!.toLowerCase().contains(filterModel.value.title!))
          .toList();
      conditionMet = true;
    }

    if (filterModel.value.date != null) {
      listtalks.value = listtalksAll
          .where((element) =>
              element.date!.isAtSameMomentAs(filterModel.value.date!))
          .toList();
      conditionMet = true;
    }

    if (!conditionMet) {
      listtalks.value = listtalksAll;
    }
  }
}

class FilterModel {
  String? title;
  DateTime? date;
  FilterModel({
    this.title,
    this.date,
  });
}
