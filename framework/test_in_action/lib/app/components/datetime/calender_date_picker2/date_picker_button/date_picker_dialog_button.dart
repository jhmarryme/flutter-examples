import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_in_action/common/constants/colors.dart';

import 'date_picker_dialog_button_state.dart';

class DatePickerButton<DatePickerState extends DataPickerDialogButtonState>
    extends StatelessWidget {
  const DatePickerButton({super.key, required this.state});

  final DatePickerState state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () async {
          final values = await showCalendarDatePicker2Dialog(
            context: context,
            config: state.config,
            dialogSize: Size(350.spMin, 400.spMin),
            borderRadius: BorderRadius.circular(15),
            value: state.dialogCalendarPickerValue,
            dialogBackgroundColor: Colors.white,
          );
          state.savePickedValue(values);
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(15.spMin, 5.spMin, 15.spMin, 5.spMin),
          margin:
              EdgeInsets.only(top: 15.spMin, left: 15.spMin, right: 15.spMin),
          decoration: BoxDecoration(
            color: ColorStyle.kGrey100,
            borderRadius: BorderRadiusDirectional.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state.chosen.value
                    ? state.dateRangeStrWithSeparator.value
                    : "Choose Date Time",
                style:
                    TextStyle(fontSize: 15.spMin, color: ColorStyle.kGrey500),
              ),
              Visibility(
                visible: state.chosen.value,
                replacement: Opacity(
                  opacity: 0,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.clear)),
                ),
                child: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => state.clearPickedValue(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
