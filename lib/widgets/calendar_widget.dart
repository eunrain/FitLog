import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() {
    return _CalendarWidgetState();
  }
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime firstDay = DateTime(now.year - 1, now.month, now.day);
    final DateTime lastDay = DateTime(now.year + 1, now.month, now.day);

    return Column(
      children: [
        TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: firstDay,
          lastDay: lastDay,
          selectedDayPredicate: (day) {
            return isSameDay(selectedDate, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              selectedDate = selectedDay;
            });
          },
        ),
      ],
    );
  }
}
