import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/modules/tarefas/views/filter_view.dart';
import 'package:flutter_to_do_list/app/services/funcoes.dart';
import 'package:flutter_to_do_list/app/theme/colors/light_colors.dart';
import 'package:get/get.dart';

import '../controllers/tarefas_controller.dart';

class TarefasView extends GetView<TarefasController> {
  TarefasView({Key? key}) : super(key: key);
  final navigationController = Get.find<TarefasController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColors.kDarkYellow,
        title: const Text("Tarefas"),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              Get.to(() => FilterView());
            },
          ),
        ],
      ),
      body: Obx(() => ListView.separated(
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemCount: navigationController.listtalks.value.length,
              itemBuilder: (BuildContext context, int index) {
                TalksModel talk = navigationController.listtalks.value[index];
                // Aqui você pode criar um widget para exibir os detalhes de cada objeto TalksModel.
                return ListTile(
                  onTap: () {
                    print('clicado');
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // navigationController.deleteTalk(talk);
                    },
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        // Envolver o )Text com Expanded
                  child: Text(
                    talk.title ?? "",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      formatDateTime(
                        talk.date ?? DateTime.now(),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),

            subtitle: Text(talk.description ?? ""),

            // Adicione outros campos conforme necessário.
          );
        },
      ),
    )
    );
  }
}
