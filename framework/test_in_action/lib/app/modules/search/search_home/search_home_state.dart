import 'package:get/get.dart';
import 'package:test_in_action/app/components/business/search/choose_city_text_inkwell/choose_city_text_inkwell_state.dart';
import 'package:test_in_action/app/components/datetime/calender_date_picker2/date_picker_button/date_picker_dialog_button_state.dart';
import 'package:test_in_action/app/components/picker/number_picker/default_number_picker_state.dart';
import 'package:test_in_action/app/modules/search/choose_type/choose_type_state.dart';
import 'package:test_in_action/app/modules/search/picker_button/picker_button_state.dart';

class SearchHomeState {
  final firstDate = "".obs;
  final secondDate = "".obs;

  /// from城市选择器 state
  final fromCityState = ChooseCityTextInkWellState();

  /// to城市选择器 state
  final toCityState = ChooseCityTextInkWellState();

  /// 日期选择器state
  final DataPickerDialogButtonState datePickerState =
      DataPickerDialogButtonState();

  /// 类型选择器state
  final ChooseTypeState chooseTypeState = ChooseTypeState();

  final PickerButtonState pickerButtonState = PickerButtonState();
}
