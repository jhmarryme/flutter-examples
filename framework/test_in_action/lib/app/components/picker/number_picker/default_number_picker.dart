import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

import 'default_number_picker_state.dart';

class DefaultNumberPicker extends StatelessWidget {
  const DefaultNumberPicker({
    super.key,
    required this.labelText,
    required this.iconData,
    required this.state,
  });

  final String labelText;

  final IconData iconData;

  final NumberPickerState state;

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
            return NumberPicker(
              value: state.currentValue.value,
              minValue: state.minValue.value,
              maxValue: state.maxValue.value,
              onChanged: (value) => state.currentValue.value = value,
              haptics: false,
              axis: Axis.horizontal,
            );
          }),
        ),
      ],
    );
  }
}
