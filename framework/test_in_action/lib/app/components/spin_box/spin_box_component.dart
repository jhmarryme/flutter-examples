import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';

import 'spin_box_state.dart';

class NumberSpinBoxComponent extends StatelessWidget {
  const NumberSpinBoxComponent({
    super.key,
    required this.labelText,
    required this.iconData,
    required this.state,
  });

  final String labelText;

  final IconData iconData;

  final NumberSpinBoxState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0.spMin),
          child: Text(labelText, style: TextStyle(fontSize: 16.0.spMin)),
        ),
        const Spacer(),
        Expanded(
          child: Obx(() {
            return CupertinoSpinBox(
              min: state.minValue.value.toDouble(),
              max: state.maxValue.value.toDouble(),
              value: state.currentValue.value.toDouble(),
              onChanged: (value) => state.currentValue.value = value.toInt(),
            );
          }),
        ),
      ],
    );
  }
}
