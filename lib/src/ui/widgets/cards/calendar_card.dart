import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:frontend/src/data/shwokl/workout_logs/workout_log.dart';

class CalendarCard extends StatelessWidget {
  final List<WorkoutLog> logs;
  const CalendarCard(this.logs);

  Map<DateTime, List<Map<String, dynamic>>> _listToMap() {
    final Map<DateTime, List<Map<String, dynamic>>> map = {};

    // ignore: avoid_function_literals_in_foreach_calls
    logs.forEach((element) {
      map.putIfAbsent(
          element.date,
          () => [
                {'name': element.name, 'isDone': true}
              ]);
    });

    return map;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Widget _customDayBuilder(BuildContext context, DateTime date) {
      return Text(
        date.day.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: (theme.brightness == Brightness.dark)
              ? Colors.white54
              : Colors.black87,
          fontWeight: FontWeight.w400,
        ),
      );
    }

    return Card(
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: 500,
        child: Calendar(
          weekDays: const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
          startOnMonday: true,
          isExpandable: true,
          isExpanded: true,
          events: _listToMap(),
          selectedColor: theme.primaryColorDark,
          eventDoneColor: theme.accentColor,
          todayColor: Theme.of(context).primaryColorDark,
          dayBuilder: _customDayBuilder,
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
