import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';

class TarefasController extends GetxController {
  RxList<TalksModel> listtalks = RxList<TalksModel>([]);
  Rx<TextEditingController> controller = TextEditingController().obs;
  Rx<FilterModel> filterModel = FilterModel().obs;
  List<TalksModel> listtalksAll = [];
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();

   atualizar();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> deleteTalk(TalksModel talksModel) async {
    await RepositoryTalks.deteleTalk(talksModel);
    atualizar();
  }
  Future<void> atualizar() async {
    listtalks.value = await RepositoryTalks.GetTalks();
    listtalksAll = listtalks.value;
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
