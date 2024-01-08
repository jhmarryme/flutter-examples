import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/datetime/calender_date_picker2/date_picker_button/date_picker_dialog_button_state.dart';
import 'package:test_in_action/app/components/picker/custom_picker/bottom_sheet_item_picker/item_picker_state.dart';

import 'components/choose_city_text_inkwell/city_picker_state.dart';
import 'components/passenger_picker/passenger_picker_state.dart';

class FlightSearchAreaState {
  /// 查询方法
  final CitySearchFunction chooseCityFunction;

  /// from城市选择器 state
  final CityPickerState fromCityPickerState;

  /// to城市选择器 state
  final CityPickerState toCityPickerState;

  /// 行程类型选择器 state
  final ItemPickerState tripTypePickerState = ItemPickerState();

  /// 日期选择器state
  final DataPickerDialogButtonState datePickerState =
      DataPickerDialogButtonState();

  /// 乘客选择器state
  final PickerButtonState passengerPickerState = PickerButtonState();

  FlightSearchAreaState(this.chooseCityFunction)
      : fromCityPickerState = CityPickerState(chooseCityFunction),
        toCityPickerState = CityPickerState(chooseCityFunction) {
    /// 初始化行程类型选择器
    tripTypePickerState.items.addAll([
      const Item("One way", "1", FontAwesomeIcons.rightLong),
      const Item("Multiple Ways", "2", FontAwesomeIcons.rightLeft),
      const Item("Round way", "3", FontAwesomeIcons.arrowsSplitUpAndLeft),
    ]);
    tripTypePickerState.chosenItem = tripTypePickerState.items[0].obs;
  }
}
