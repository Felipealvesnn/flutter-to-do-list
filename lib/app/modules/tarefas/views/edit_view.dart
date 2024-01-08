import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/Constants/validators.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/modules/home/components/itens.dart';
import 'package:flutter_to_do_list/app/modules/home/views/home_view.dart';
import 'package:flutter_to_do_list/app/modules/tarefas/controllers/tarefas_controller.dart';
import 'package:flutter_to_do_list/app/services/funcoes.dart';
import 'package:flutter_to_do_list/app/theme/colors/light_colors.dart';
import 'package:flutter_to_do_list/app/widgets/back_button.dart';
import 'package:flutter_to_do_list/app/widgets/my_text_field.dart';
import 'package:flutter_to_do_list/app/widgets/top_container.dart';

import 'package:get/get.dart';

class EditTaskPageView extends GetView<TarefasController> {
  @override
  final controller = Get.find();
  final Keyform = GlobalKey<FormState>();

  EditTaskPageView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: Keyform,
              child: Column(
                children: <Widget>[
                  // container de titulo
                  TopContainer(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                    width: width,
                    child: Column(
                      children: <Widget>[
                        const MyBackButton(),
                        const SizedBox(
                          height: 30,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Editar tarefa',
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MyTextField(
                              initialValue: controller.talksModel.title,
                              label: 'Title',
                              onSaved: (p0) {
                                controller.talksModel.title = p0;
                              },
                              Validator: nameValidator,
                            ),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                    child: MyTextField(
                                        //initialValue: controller
                                            //.talksModel.date!
                                            //.toString(),
                                            //.split(' ')[0],
                                        controller:
                                            controller.controllerCalendar.value,
                                        label: 'Date',
                                        icon: buildDownwardIcon(context),
                                        onSaved: (p0) {
                                          controller.talksModel.date =
                                              DateTime.parse(p0!);
                                        },
                                        Validator: nameValidator),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        openCalendar(context,
                                            controller.controllerCalendar);
                                      },
                                      child: calendarIcon()),
                                ],
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                  //coitaina de time e descrição
                  Expanded(
                      child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Obx(
                              () => Expanded(
                                child: MyTextField(
                                  // initialValue: controller.talksModel.StartTime!
                                  //     .toString()
                                  //     .split(' ')[1]
                                  //     .split('.')[0],
                                  controller: controller.controllerStart.value,
                                  onSaved: (p0) {
                                    controller.talksModel.StartTime =
                                        parseTimeStringToDateTime(
                                            controller.talksModel.date!, p0!);
                                  },
                                  label: 'Start Time',
                                  icon: controller
                                          .controllerEnd.value.text.isNotEmpty
                                      ? buildDownwardIcon(context,
                                          model: controller.controllerStart,
                                          horafinal: controller
                                              .controllerEnd.value.text)
                                      : buildDownwardIcon(
                                          context,
                                          model: controller.controllerStart,
                                        ),
                                  Validator: nameValidator,
                                ),
                              ),
                            ),
                            const SizedBox(width: 40),
                            Obx(
                              () => Expanded(
                                child: MyTextField(
                                  // initialValue: controller.talksModel.EndTime!
                                  //     .toString()
                                  //     .split(' ')[1]
                                  //     .split('.')[0],
                                  controller: controller.controllerEnd.value,
                                  onSaved: (p0) {
                                    controller.talksModel.EndTime =
                                        parseTimeStringToDateTime(
                                            controller.talksModel.date!, p0!);
                                  },
                                  label: 'End Time',
                                  icon: buildDownwardIcon(context,
                                      model: controller.controllerEnd,
                                      horainicial: controller
                                          .controllerStart.value.text),
                                  Validator: nameValidator,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        MyTextField(
                          initialValue: controller.talksModel.description,
                          onSaved: (p0) {
                            controller.talksModel.description = p0;
                          },
                          Validator: nameValidator,
                          label: 'Descricao',
                          minLines: 3,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 20),
                        Obx(() => Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    'Categoria',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    //direction: Axis.vertical,
                                    alignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    runSpacing: 0,
                                    //textDirection: TextDirection.rtl,
                                    spacing: 10.0,
                                    children:
                                        // Chip(
                                        //   label: Text("SPORT APP"),
                                        //   backgroundColor: LightColors.kRed,
                                        //   labelStyle: TextStyle(color: Colors.white),
                                        // ),
                                        controller.categoryList.value.map((e) {
                                      return GestureDetector(
                                        onTap: () {
                                          controller.categorySelecionada.value =
                                              e;
                                        },
                                        child: Chip(
                                          label: Text(e.nome!),
                                          backgroundColor: controller
                                                      .categorySelecionada
                                                      .value
                                                      .id ==
                                                  e.id
                                              ? LightColors.kRed
                                              : null,
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  )),
                  ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (Keyform.currentState!.validate()) {
                        Keyform.currentState!.save();
                        controller.editarTal();
                        // Exibir mensagem de sucesso após salvar

                        Get.back();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LightColors.kBlue, // Cor de fundo
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Borda arredondada
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        'Create Task',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
