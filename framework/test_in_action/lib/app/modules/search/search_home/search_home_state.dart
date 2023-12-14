import 'package:get/get.dart';
import 'package:test_in_action/app/components/datetime/calender_date_picker2/dialog_button/dialog_button_state.dart';
import 'package:test_in_action/app/modules/search/choose_type/choose_type_state.dart';

class SearchHomeState {
  final firstDate = "".obs;
  final secondDate = "".obs;

  final String fromCityLogicTag = "home-fromCityLogicTag";

  final String toCityLogicTag = "home-toCityLogicTag";

  /// 日期选择器state
  CalendarDialogButtonState? datePickerState;

  /// 类型选择器state
  ChooseTypeState chooseTypeState = ChooseTypeState();
}
