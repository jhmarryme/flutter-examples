import 'package:test_in_action/app/components/spin_box/spin_box_state.dart';

class PickerButtonState {
  /// 成人选择器state
  final NumberSpinBoxState adultsState = NumberSpinBoxState();

  /// 婴儿选择器state
  final NumberSpinBoxState infantsState = NumberSpinBoxState();

  /// 行李选择器state
  final NumberSpinBoxState baggageState = NumberSpinBoxState();

  PickerButtonState() {
    adultsState.currentValue.value = 1;
  }
}
