import 'package:get/get.dart';

import '../controllers/tarefas_controller.dart';

class TarefasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TarefasController>(
      () => TarefasController(),
    );
  }
}
