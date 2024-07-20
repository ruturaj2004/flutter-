import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalanderWidget extends StatefulWidget {
  const CalanderWidget({required this.context, Key? key}) : super(key: key);
  final BuildContext context;

  @override
  State<CalanderWidget> createState() => _CalanderWidgetState();
}

class _CalanderWidgetState extends State<CalanderWidget> {
  DateTime today = DateTime.now();

  void _onDateSelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        width: double.maxFinite,
          color: Color.fromARGB(255, 220, 220, 220),
          child: TableCalendar(
            locale: "en_US",
            rowHeight: 40,
            headerStyle: HeaderStyle(formatButtonVisible: false),
            focusedDay: today,
            selectedDayPredicate: (day) => isSameDay(day, today),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 10, 16),
            onDaySelected: _onDateSelected,
          ),
        )
      ],
    );
  }
}
