import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:get/get.dart';

import '../controllers/tarefas_controller.dart';

class TarefasView extends GetView<TarefasController> {
  TarefasView({Key? key}) : super(key: key);
  final navigationController = Get.find<TarefasController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
      ),
      body: ListView.separated(
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
            title: Text(talk.title ?? ""),
            subtitle: Text(talk.description ?? ""),
            // Adicione outros campos conforme necessário.
           
          );
        },
      ),
    );
  }
}
