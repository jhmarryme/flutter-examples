import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/chart/syncfusion/cartesion_chart/default_cartesion_chart.dart';
import 'package:test_in_action/app/components/chart/syncfusion/circular_chart/default_circular_chart.dart';

import 'chart_logic.dart';

class ChartView extends StatelessWidget {
  const ChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ChartLogic>();

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          DefaultCartesianChart(),
          DefaultCircularChart(),
        ],
      ),
    );
  }
}
