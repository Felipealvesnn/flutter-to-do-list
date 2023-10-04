import 'package:get/get.dart';

import '../controllers/create_new_task_page_controller.dart';

class CreateNewTaskPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNewTaskPageController>(
      () => CreateNewTaskPageController(),
    );
  }
}
