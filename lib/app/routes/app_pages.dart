import 'package:get/get.dart';

import '../modules/CalendarPage/bindings/calendar_page_binding.dart';
import '../modules/CalendarPage/views/calendar_page_view.dart';
import '../modules/CreateNewTaskPage/bindings/create_new_task_page_binding.dart';
import '../modules/CreateNewTaskPage/views/create_new_task_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
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
      page: () => const CreateNewTaskPageView(),
      binding: CreateNewTaskPageBinding(),
    ),
    GetPage(
        name: _Paths.CALENDAR_PAGE,
        page: () =>  CalendarPageView(),
        bindings: [
          CalendarPageBinding(),
          CreateNewTaskPageBinding(),
        ]
        ),
  ];
}
