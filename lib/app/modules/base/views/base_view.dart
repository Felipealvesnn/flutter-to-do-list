import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/modules/home/views/home_view.dart';
import 'package:flutter_to_do_list/app/modules/tarefas/views/tarefas_view.dart';

import 'package:get/get.dart';

import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  BaseView({Key? key}) : super(key: key);
  final navigationController = Get.find<BaseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: navigationController.pageController,
        children: [
          HomeView(),
           TarefasView(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: navigationController.currentIndex,
          onDestinationSelected: (int index) {
            navigationController.navigationPageview(index);
          },
          indicatorColor: Colors.amber[800],
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Tarefas',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.school),
              icon: Icon(Icons.category_outlined),
              label: 'Categorias',
            ),
          ],
        ),
      ),
    );
  }
}
