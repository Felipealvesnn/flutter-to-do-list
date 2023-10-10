import 'package:flutter/material.dart';

class CalendarDates extends StatelessWidget {
  final String day;
  final String date;
  final Color dayColor;
  final Color dateColor;
  final bool? isSelect;

  const CalendarDates(
      {super.key,
      this.isSelect = false,
      required this.day,
      required this.date,
      required this.dayColor,
      required this.dateColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isSelect!
          ? BoxDecoration(
              color: const Color.fromARGB(46, 221, 52, 52) ,
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      padding: const EdgeInsets.only(right: 10.0, left: 10.0,),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            day,
            style: TextStyle(
                fontSize: 16, color: dayColor, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10.0),
          Text(
            date,
            style: TextStyle(
                fontSize: 16, color: dateColor, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
