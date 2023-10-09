import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/models/category.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/modules/home/repository/repositoryHome.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxList<TalksModel> listTalks = RxList<TalksModel>([]);
  RxList<Category> listCategory = RxList<Category>([]);
  RxList<CategoryQtdTalks> listCategoryQtdTalks = RxList<CategoryQtdTalks>([]);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    GetTalksQtd();
  }

  Future<void> GetTalksQtd() async {
    listCategoryQtdTalks.value = await RepositoryHome.GetTalksQtd();
    print(listCategoryQtdTalks.value);
  }

  void increment() => count.value++;
}
