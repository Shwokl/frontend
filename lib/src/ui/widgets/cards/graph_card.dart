import 'package:charts_flutter/flutter.dart' as charts
    show LineChart, Series, ColorUtil;
import 'package:flutter/material.dart';

// TODO implement with data models
class ChartCard extends StatelessWidget {
  final String title;
  final List<DataPoints> data;
  final Color color;
  const ChartCard(
    this.title,
    this.data, {
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
    return Card(
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: 500,
        height: 375,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
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
