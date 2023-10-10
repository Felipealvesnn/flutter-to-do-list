import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';
import 'package:get/get.dart';

abstract class NavigationTabs {
  static const int home = 0;
  static const int talks = 1;
  static const int orders = 2;
  
}


class BaseController extends GetxController {
  //TODO: Implement BaseController
  late PageController _pageController;
  late RxInt _currentIndex;


  PageController get pageController => _pageController;
  int get currentIndex => _currentIndex.value;

  @override
  void onInit() async{
    super.onInit();
   
    _initNavigation(
      pageController: PageController(initialPage: NavigationTabs.home),
      initialPage: NavigationTabs.home,
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _initNavigation(
      {required PageController pageController, required int initialPage}) {
    _pageController = pageController;
    _currentIndex = initialPage.obs;
  }

  void navigationPageview(int page) {
    if (page == _currentIndex.value) return;
    _currentIndex.value = page;
    _pageController.jumpToPage(page);
  }


}
