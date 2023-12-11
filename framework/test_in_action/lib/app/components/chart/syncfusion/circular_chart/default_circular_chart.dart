import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_in_action/app/components/chart/syncfusion/circular_chart/circular_chart_data.dart';

class DefaultCircularChart extends StatelessWidget {
  const DefaultCircularChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);
    return SfCircularChart(
      title: ChartTitle(text: 'Sales by sales person'),
      legend: const Legend(isVisible: true),
      tooltipBehavior: tooltipBehavior,
      series: [
        PieSeries<CircularChartData, String>(
          enableTooltip: true,
          dataSource: [
            CircularChartData('Jan', 35),
            CircularChartData('Feb', 28),
            CircularChartData('Mar', 34),
            CircularChartData('Apr', 32),
            CircularChartData('May', 40),
            CircularChartData('May', 40),
          ],
          xValueMapper: (data, _) => data.x,
          yValueMapper: (data, _) => data.y,
          dataLabelMapper: (datum, index) => datum.x + '-' + datum.y.toString(),
          // radius: '60%',
          dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelIntersectAction: LabelIntersectAction.shift,
              labelPosition: ChartDataLabelPosition.outside,
              connectorLineSettings: ConnectorLineSettings(
                type: ConnectorType.curve,
                length: '25%',
              )),
        ),
      ],
    );
  }
}
