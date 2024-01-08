
import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/modules/home/components/itens.dart';
import 'package:flutter_to_do_list/app/modules/home/views/home_view.dart';
import 'package:flutter_to_do_list/app/modules/tarefas/controllers/tarefas_controller.dart';
import 'package:flutter_to_do_list/app/services/funcoes.dart';
import 'package:flutter_to_do_list/app/theme/colors/light_colors.dart';
import 'package:flutter_to_do_list/app/widgets/back_button.dart';
import 'package:flutter_to_do_list/app/widgets/my_text_field.dart';
import 'package:flutter_to_do_list/app/widgets/top_container.dart';
import 'package:get/get.dart';

class FilterView extends StatelessWidget {
  FilterView({super.key});
  final controller = Get.find<TarefasController>();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: TopContainer(
          redondo: false,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const MyBackButton(),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Filtrar Tarefas',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MyTextField(
                      label: 'Title',
                      onSaved: (p0) {
                        controller.filterModel.value.title = p0;
                      },
                      // Validator: nameValidator,
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: MyTextField(
                              controller: controller.controllerCalendar.value,
                              label: 'Date',
                              icon: buildDownwardIcon(context),
                              onSaved: (p0) {
                                if (p0!.isEmpty) return;
                                controller.filterModel.value.date =
                                    DateTime.parse(p0);
                              },
                              //Validator: nameValidator
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                openCalendar(context, controller.controllerCalendar);
                              },
                              child: calendarIcon()),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_form.currentState!.validate()) {
                          _form.currentState!.save();
                          controller.filterTalskList();
                          _form.currentState!.reset();
                          controller.controllerCalendar.value.clear();
                          controller.filterModel.value.date = null;
                        }

                        Get.back();
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
                          'Filtrar',
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
              )
            ],
          ),
        ),
      ),
    );
    //coitaina de time e descrição
  }
}
