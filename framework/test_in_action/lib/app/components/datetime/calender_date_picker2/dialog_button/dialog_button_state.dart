import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/datetime/calender_date_picker2/calendar_helper.dart';

class CalendarDialogButtonState {
  /// 日期选择器-所选日期值, 不满意可用子类自行覆盖
  final dialogCalendarPickerValue = <DateTime?>[
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  ].obs;

  /// 默认日期文本样式
  final dayTextStyle =
      const TextStyle(color: Colors.black, fontWeight: FontWeight.w700);

  /// 默认周末日期文本样式
  final weekendTextStyle =
      TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);

  /// 特殊日期文本样式-目前未使用
  final anniversaryTextStyle = TextStyle(
    color: Colors.red[400],
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  /// 日期范围-字符串展示
  final dateRangeStrWithSeparator = "".obs;

  /// 是否已经选择日期
  final chosen = false.obs;

  /// 日期选择器初始化所需配置信息, 需要context信息, 故延迟加载
  late final CalendarDatePicker2WithActionButtonsConfig? config;

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

  // late final DateTime? anniversaryDate;

  /// 保存所选日期, 标记为已选择
  void savePickedValue(List<DateTime?>? values) {
    if (values != null) {
      dialogCalendarPickerValue.clear();
      dialogCalendarPickerValue.addAll(values);
      dateRangeStrWithSeparator.value =
          CalenderHelper.getRangeDateWithSeparator(values);
      chosen.value = true;
    }
  }

  /// 清空所选日期, 标记为未选择
  void clearPickedValue() {
    dialogCalendarPickerValue.clear();
    dateRangeStrWithSeparator.value = "";
    chosen.value = false;
  }
}
