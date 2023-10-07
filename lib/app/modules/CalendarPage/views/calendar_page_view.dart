import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/modules/CalendarPage/controllers/calendar_page_controller.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/controllers/create_new_task_page_controller.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/views/create_new_task_page_view.dart';
import 'package:flutter_to_do_list/app/routes/app_pages.dart';
import 'package:flutter_to_do_list/app/services/services.dart';
import 'package:flutter_to_do_list/app/theme/colors/light_colors.dart';
import 'package:flutter_to_do_list/app/widgets/back_button.dart';
import 'package:flutter_to_do_list/app/widgets/calendar_dates.dart';
import 'package:flutter_to_do_list/app/widgets/task_container.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPageView extends StatelessWidget {
  CalendarPageView({super.key});

  final controller = Get.find<CreateNewTaskPageController>();
  final controllerCalendar = CalendarController();

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
        child: SizedBox(
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
                              Get.toNamed(Routes.CREATE_NEW_TASK_PAGE);
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
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     data,
                  //     style: const TextStyle(
                  //         fontWeight: FontWeight.w500, fontSize: 20),
                  //   ),
                  // ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: SfCalendar(
                      dataSource: MeetingDataSource(_getDataSource()),
                      monthViewSettings:
                          const MonthViewSettings(appointmentDisplayCount: 2),
                      controller: controllerCalendar,
                      view: CalendarView.week,
                      showNavigationArrow: true,
                      showDatePickerButton: true,
                      timeSlotViewSettings:
                          const TimeSlotViewSettings(numberOfDaysInView: 4),
                      todayHighlightColor: Colors.red,
                      cellBorderColor: Colors.blue,

                      //firstDayOfWeek: 1, // Monday
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

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Meeting(
      'Conference', startTime, endTime, const Color(0xFF0F8644), false));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
