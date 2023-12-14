import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/datetime/calender_date_picker2/dialog_button/dialog_button_state.dart';
import 'package:test_in_action/app/components/search/search_modal_bootm_sheet/choose_city_input_logic.dart';
import 'package:test_in_action/app/dao/search/city_entity.dart';

import 'search_home_state.dart';

class SearchHomeLogic extends GetxController {
  final SearchHomeState state = SearchHomeState();

  SearchHomeLogic() {
    initializeCityChooseLogic();
  }

  ChooseCityInputLogic get fromCityLogic =>
      Get.find<ChooseCityInputLogic>(tag: state.fromCityLogicTag);

  ChooseCityInputLogic get toCityLogic =>
      Get.find<ChooseCityInputLogic>(tag: state.toCityLogicTag);

  void swapCity() {
    bool chosen = fromCityLogic.chosen.value;
    final cityJson = fromCityLogic.cityEntity.value.toJson();

    fromCityLogic.chosen.value = toCityLogic.chosen.value;
    fromCityLogic.updateCity(toCityLogic.cityEntity.value);

    toCityLogic.chosen.value = chosen;
    toCityLogic.updateCity(CityEntity.fromJson(cityJson));
  }

  void initializeCityChooseLogic() {
    Get.put(ChooseCityInputLogic(), tag: state.fromCityLogicTag);
    Get.put(ChooseCityInputLogic(), tag: state.toCityLogicTag);
  }

  late final int myNumber;

  void initializeDatePicker(BuildContext context) {
    state.datePickerState ??= CalendarDialogButtonState(context);
  }
}
