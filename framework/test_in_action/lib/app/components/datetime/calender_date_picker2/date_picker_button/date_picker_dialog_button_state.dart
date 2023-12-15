import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/datetime/calender_date_picker2/calendar_helper.dart';

class DataPickerDialogButtonState {
  /// 日期选择器-所选日期值, 不满意可用子类自行覆盖
  final dialogCalendarPickerValue = <DateTime?>[
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  ].obs;

  /// 日期范围-字符串展示
  final dateRangeStrWithSeparator = "".obs;

  /// 是否已经选择日期
  final chosen = false.obs;

  /// 日期选择器初始化所需配置信息, 需要context信息, 故延迟加载
  final CalendarDatePicker2WithActionButtonsConfig config =
      CalendarDatePicker2WithActionButtonsConfig(
    calendarType: CalendarDatePicker2Type.range,
  );

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
    chosen.value = false;
    dialogCalendarPickerValue.clear();
    dateRangeStrWithSeparator.value = "";
  }
}
