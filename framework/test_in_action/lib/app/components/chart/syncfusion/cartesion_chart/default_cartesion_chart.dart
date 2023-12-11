import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_in_action/app/components/chart/syncfusion/cartesion_chart/sales_data.dart';

class DefaultCartesianChart extends StatelessWidget {
  const DefaultCartesianChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(text: 'Half yearly sales analysis'),
      legend: const Legend(isVisible: true),
      tooltipBehavior: tooltipBehavior,
      series: <LineSeries<SalesData, String>>[
        LineSeries<SalesData, String>(
          dataSource: [
            SalesData('Jan', 35),
            SalesData('Feb', 28),
            SalesData('Mar', 34),
            SalesData('Apr', 32),
            SalesData('May', 40),
          ],
          xValueMapper: (datum, index) => datum.xValue,
          yValueMapper: (datum, index) => datum.yValue,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
        LineSeries<SalesData, String>(
          dataSource: [
            SalesData('Jan', 1),
            SalesData('Feb', 3),
            SalesData('Mar', 4),
            SalesData('Apr', 5),
            SalesData('May', 6),
          ],
          xValueMapper: (datum, index) => datum.xValue,
          yValueMapper: (datum, index) => datum.yValue,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        )
      ],
    );
  }
}
