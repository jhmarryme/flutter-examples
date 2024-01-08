import 'package:get/get.dart';

import 'components/choose_city_text_inkwell/city_info_entity.dart';
import 'components/choose_city_text_inkwell/city_picker_state.dart';
import 'flight_search_area_state.dart';

class FlightSearchAreaLogic extends GetxController {
  final CitySearchFunction citySearchFunction;

  final FlightSearchAreaState state;

  FlightSearchAreaLogic(this.citySearchFunction)
      : state = FlightSearchAreaState(citySearchFunction);

  /// 交换from/to 选择器的值
  void swapCity() {
    bool tempChosen = state.fromCityPickerState.chosen.value;
    final tempJson = state.fromCityPickerState.data.value.toJson();

    state.fromCityPickerState.chosen.value =
        state.toCityPickerState.chosen.value;
    state.fromCityPickerState.save(state.toCityPickerState.data.value);

    state.toCityPickerState.chosen.value = tempChosen;
    state.toCityPickerState.save(CityInfoEntity.fromJson(tempJson));
  }
}
