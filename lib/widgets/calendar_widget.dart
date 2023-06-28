import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  State<CalendarWidget> createState() {
    return _CalendarWidget();
  }
}

class _CalendarWidget extends State<CalendarWidget> {
  final _now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(_now.year - 1, _now.month, _now.day),
      lastDay: DateTime(_now.year + 1, _now.month, _now.day),
    );
  }
}
