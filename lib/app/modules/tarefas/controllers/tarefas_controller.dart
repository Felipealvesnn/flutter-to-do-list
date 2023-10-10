import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';

class TarefasController extends GetxController {
 
  RxList<TalksModel> listtalks = RxList<TalksModel>([]);
  Rx<TextEditingController> controller = TextEditingController().obs;
  Rx<FilterModel> filterModel = FilterModel().obs;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();

    listtalks.value = await RepositoryTalks.GetTalks();
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

class FilterModel {
  String? title;
  DateTime? date;
  FilterModel({
    this.title,
    this.date,
  });
}
