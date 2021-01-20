import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:frontend/src/data/shwokl/workout_logs/workout_log.dart';

class CalendarCard extends StatelessWidget {
  final List<WorkoutLog> logs;
  final double scale;
  const CalendarCard(this.logs, {this.scale = 1});

  Map<DateTime, List<Map<String, dynamic>>> _mapBuilder() {
    final Map<DateTime, List<Map<String, dynamic>>> map = {};

    // ignore: avoid_function_literals_in_foreach_calls
    logs.forEach((element) {
      map.putIfAbsent(
        element.date,
        () => [
          {
            'name': element.name,
            'isDone': true,
          }
        ],
      );
    });

    return map;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const double minWidth = 425;
    const double referenceWidth = 650;

    return Card(
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: max(minWidth, referenceWidth * scale),
        child: Calendar(
          weekDays: const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
          startOnMonday: true,
          isExpandable: true,
          isExpanded: true,
          events: _mapBuilder(),
          selectedColor: theme.primaryColorDark,
          eventDoneColor: theme.accentColor,
          todayColor: Theme.of(context).primaryColorDark,
          dayOfWeekStyle: TextStyle(
            color: (theme.brightness == Brightness.dark)
                ? Colors.white30
                : Colors.black45,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
