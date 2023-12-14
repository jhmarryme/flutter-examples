import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/datetime/calender_date_picker2/calendar_helper.dart';

class CalendarWithActionButtons extends StatelessWidget {
  CalendarWithActionButtons({super.key});

  final config = CalendarDatePicker2WithActionButtonsConfig(
    calendarType: CalendarDatePicker2Type.range,
    disableModePicker: true,
  );

  final List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  ].obs;

  String get value => CalenderHelper.getValueText(
      config.calendarType, _rangeDatePickerWithActionButtonsWithValue);

  @override
  Widget build(BuildContext context) {
    final config = CalendarDatePicker2WithActionButtonsConfig(
      calendarType: CalendarDatePicker2Type.range,
      disableModePicker: true,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        const Text('Date Picker With Action Buttons'),
        CalendarDatePicker2WithActionButtons(
          config: config,
          value: _rangeDatePickerWithActionButtonsWithValue,
          onValueChanged: (dates) {
            _rangeDatePickerWithActionButtonsWithValue.clear();
            _rangeDatePickerWithActionButtonsWithValue.addAll(dates);
          },
        ),
      ],
    );
  }
}
