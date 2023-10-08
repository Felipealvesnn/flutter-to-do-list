


import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class calendarioTRaadoo extends CalendarDataSource {

  calendarioTRaadoo(List<TalksModel> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].StartTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].EndTime;
  }

  

  @override
  String getSubject(int index) {
    return appointments![index].title;
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
