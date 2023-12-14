import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'dialog_button_state.dart';

class CalendarDialogButtonHelper {
  static buildDefaultCalendarDialogButton<
          State extends CalendarDialogButtonState>(
      BuildContext context, State state) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
        onPressed: () async {
          final values = await showCalendarDatePicker2Dialog(
            context: context,
            config: state.config,
            dialogSize: const Size(325, 400),
            borderRadius: BorderRadius.circular(15),
            value: state.dialogCalendarPickerValue,
            dialogBackgroundColor: Colors.white,
          );
          if (values != null) {
            state.dialogCalendarPickerValue.clear();
            state.dialogCalendarPickerValue.addAll(values);
          }
        },
        child: const Text('Open Calendar Dialog'),
      ),
    );
  }
}
