import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class FunceCalendar {
  static String? _title = '',
      _startTimeText = '',
      _endTimeText = '',
      _dateText = '',
      _timeDetails = '',
      _descricao = '';
  Color? _headerColor, _viewHeaderColor, _calendarColor;

  static void calendarTapped(CalendarTapDetails details, BuildContext context) {
    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      final TalksModel appointmentDetails = details.appointments![0];
      _title = appointmentDetails.title;
      _descricao = appointmentDetails.description;
      _dateText = DateFormat('MMMM dd, yyyy')
          .format(appointmentDetails.StartTime!)
          .toString();
      _startTimeText = DateFormat('hh:mm a')
          .format(appointmentDetails.StartTime!)
          .toString();
      _endTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.EndTime!).toString();
      if (appointmentDetails.isAllDay!) {
        _timeDetails = 'All day';
      } else {
        _timeDetails = '$_startTimeText - $_endTimeText';
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Container(child: Text('$_title')),
              content: SizedBox(
                height: context.height * 0.2,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '$_dateText',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                       // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Descricao: $_descricao!",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15)),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(_timeDetails!,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }
}
