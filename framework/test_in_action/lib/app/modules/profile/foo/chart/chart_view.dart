import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/chart/syncfusion/cartesion_chart/default_cartesion_chart.dart';
import 'package:test_in_action/app/components/chart/syncfusion/circular_chart/default_circular_chart.dart';

class FooChartView extends StatelessWidget {
  const FooChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          DefaultCartesianChart(),
          DefaultCircularChart(),
        ],
      ),
    );
  }
}
