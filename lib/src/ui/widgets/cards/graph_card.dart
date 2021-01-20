import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts
    show LineChart, Series, ColorUtil;
import 'package:flutter/material.dart';

// TODO implement with data models
class ChartCard extends StatelessWidget {
  final String title;
  final List<DataPoints> data;
  final Color color;
  final double scale;
  const ChartCard(
    this.title,
    this.data, {
    this.scale = 1,
    this.color = Colors.blue,
  });

  List<charts.Series<DataPoints, int>> _wrapData() {
    return [
      charts.Series<DataPoints, int>(
        id: title,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(color),
        domainFn: (DataPoints data, _) => data.x,
        measureFn: (DataPoints data, _) => data.y,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    const double minWidth = 425;
    const double minHeight = 320;
    const double referenceWidth = 650;
    const double referenceHeight = 450;

    return Card(
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: max(minWidth, referenceWidth * scale),
        height: max(minHeight, referenceHeight * scale),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            SizedBox(
              height: max(minHeight, referenceHeight * scale) - 75,
              child: charts.LineChart(
                _wrapData(),
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataPoints {
  final int x;
  final double y;
  const DataPoints(this.x, this.y);
}
