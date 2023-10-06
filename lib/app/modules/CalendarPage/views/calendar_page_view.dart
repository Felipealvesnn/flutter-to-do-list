import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/modules/CalendarPage/controllers/calendar_page_controller.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/controllers/create_new_task_page_controller.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/views/create_new_task_page_view.dart';
import 'package:flutter_to_do_list/app/services/services.dart';
import 'package:flutter_to_do_list/app/theme/colors/light_colors.dart';
import 'package:flutter_to_do_list/app/widgets/back_button.dart';
import 'package:flutter_to_do_list/app/widgets/calendar_dates.dart';
import 'package:flutter_to_do_list/app/widgets/task_container.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarPageView extends StatelessWidget {
  CalendarPageView({super.key});

  final controller = Get.find<CreateNewTaskPageController>();

  // Obtenha a data atual

  Widget _dashedText() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: const Text(
        '------------------------------------------',
        maxLines: 1,
        style:
            TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String data = UtilsServices.formatDateTimeMesAno(DateTime.now());
    final ultils = UtilsServices.getHorarios();
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                0,
              ),
              child: Column(
                children: <Widget>[
                  const MyBackButton(),
                  const SizedBox(height: 30.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Today',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w700),
                        ),
                        //botao de adicionar tarefa
                        Container(
                          height: 40.0,
                          width: 130,
                          decoration: BoxDecoration(
                            color: LightColors.kGreen,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: OutlinedButton(
                            onPressed: () {
                              Get.to(() =>  CreateNewTaskPageView());
                            },
                            child: const Center(
                              child: Text(
                                'Add Tarefa',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ]),
                  const SizedBox(height: 10),
                  //nome da pessoa
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Productive Day, Felipinho',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  //scrll dias do mes
                  SizedBox(
                    height: 58.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          UtilsServices.getDiasDaSemanaEmPortugues().length,
                      itemBuilder: (BuildContext context, int index) {
                        return CalendarDates(
                          isSelect:
                              int.parse(UtilsServices.getDiasDoMes()[index]) ==
                                  DateTime.now().day,
                          day:
                              UtilsServices.getDiasDaSemanaEmPortugues()[index],
                          date: UtilsServices.getDiasDoMes()[index],
                          dayColor:
                              index == 0 ? LightColors.kRed : Colors.black54,
                          dateColor: index == 0
                              ? LightColors.kRed
                              : LightColors.kDarkBlue,
                        );
                      },
                    ),
                  ),
                  // shrol das horas mes
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: ListView.builder(
                                itemCount: ultils.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${ultils[index]} ${ultils[index] > 8 ? 'PM' : 'AM'}',
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 5,
                              child: ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  _dashedText(),
                                  TaskContainer(
                                    title: 'Project Research',
                                    subtitle:
                                        'Discuss with the colleagues about the future plan',
                                    boxColor: LightColors.kLightYellow2,
                                  ),
                                  _dashedText(),
                                  TaskContainer(
                                    title: 'Work on Medical App',
                                    subtitle: 'Add medicine tab',
                                    boxColor: LightColors.kLavender,
                                  ),
                                  TaskContainer(
                                    title: 'Call',
                                    subtitle: 'Call to david',
                                    boxColor: LightColors.kPalePink,
                                  ),
                                  TaskContainer(
                                    title: 'Design Meeting',
                                    subtitle:
                                        'Discuss with designers for new task for the medical app',
                                    boxColor: LightColors.kLightGreen,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
