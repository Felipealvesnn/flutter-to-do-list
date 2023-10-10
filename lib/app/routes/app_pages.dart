import 'package:get/get.dart';

import '../modules/CalendarPage/bindings/calendar_page_binding.dart';
import '../modules/CalendarPage/views/calendar_page_view.dart';
import '../modules/CreateNewTaskPage/bindings/create_new_task_page_binding.dart';
import '../modules/CreateNewTaskPage/views/create_new_task_page_view.dart';
import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/tarefas/bindings/tarefas_binding.dart';
import '../modules/tarefas/views/tarefas_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BASE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      // children: [
      //   GetPage(
      //     name: _Paths.HOME,
      //     page: () =>  HomeView(),
      //     binding: HomeBinding(),
      //   ),
      // ],
    ),
    GetPage(
      name: _Paths.CREATE_NEW_TASK_PAGE,
      page: () => CreateNewTaskPageView(),
      binding: CreateNewTaskPageBinding(),
    ),
    GetPage(
        name: _Paths.CALENDAR_PAGE,
        page: () => CalendarPageView(),
        bindings: [
          CalendarPageBinding(),
          CreateNewTaskPageBinding(),
        ]),
    GetPage(
      name: _Paths.BASE,
      page: () => BaseView(),
      bindings:[ BaseBinding(),
        TarefasBinding()
      ],
    ),
    GetPage(
      name: _Paths.TAREFAS,
      page: () =>  TarefasView(),
      binding: TarefasBinding(),
    ),
  ];
}
