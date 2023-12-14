import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarDialogButtonState {
  /// 自行覆盖
  final dialogCalendarPickerValue = <DateTime?>[
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  ].obs;

  final dayTextStyle =
      const TextStyle(color: Colors.black, fontWeight: FontWeight.w700);
  final weekendTextStyle =
      TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
  final anniversaryTextStyle = TextStyle(
    color: Colors.red[400],
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  late final CalendarDatePicker2WithActionButtonsConfig config;

  // late final DateTime? anniversaryDate;

  CalendarDialogButtonState(BuildContext context) {
    config = CalendarDatePicker2WithActionButtonsConfig(
      dayTextStyle: dayTextStyle,
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Colors.purple[800],
      closeDialogOnCancelTapped: true,
      firstDayOfWeek: 1,
      weekdayLabelTextStyle:
          const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      controlsTextStyle: const TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
      dayTextStylePredicate: ({required date}) {
        TextStyle? textStyle;
        if (date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday) {
          textStyle = weekendTextStyle;
        }
        // if (DateUtils.isSameDay(date, anniversaryDate)) {
        //   textStyle = anniversaryTextStyle;
        // }
        return textStyle;
      },
      dayBuilder: ({
        required date,
        textStyle,
        decoration,
        isSelected,
        isDisabled,
        isToday,
      }) {
        Widget? dayWidget;
        if (date.day % 3 == 0 && date.day % 9 != 0) {
          dayWidget = Container(
            decoration: decoration,
            child: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Text(
                    MaterialLocalizations.of(context).formatDecimal(date.day),
                    style: textStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27.5),
                    child: Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isSelected == true
                            ? Colors.white
                            : Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return dayWidget;
      },
      yearBuilder: ({
        required year,
        decoration,
        isCurrentYear,
        isDisabled,
        isSelected,
        textStyle,
      }) {
        return Center(
          child: Container(
            decoration: decoration,
            height: 36,
            width: 72,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(year.toString(), style: textStyle),
                    if (isCurrentYear == true)
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.redAccent),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
