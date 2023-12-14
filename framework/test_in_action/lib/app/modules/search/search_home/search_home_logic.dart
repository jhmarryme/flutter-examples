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

  /// 初始化日期选择器, 由于要用到context, 需要手动调动
  void initializeDatePicker(BuildContext context) {
    state.datePickerState ??= CalendarDialogButtonState(context);
  }

  /// 初始化下属logic
  void initializeCityChooseLogic() {
    Get.put(ChooseCityInputLogic(), tag: state.fromCityLogicTag);
    Get.put(ChooseCityInputLogic(), tag: state.toCityLogicTag);
  }

  /// 交换from/to 选择器的值
  void swapCity() {
    bool tempChosen = fromCityLogic.chosen.value;
    final tempCityJson = fromCityLogic.cityEntity.value.toJson();

    fromCityLogic.chosen.value = toCityLogic.chosen.value;
    fromCityLogic.updateCity(toCityLogic.cityEntity.value);

    toCityLogic.chosen.value = tempChosen;
    toCityLogic.updateCity(CityEntity.fromJson(tempCityJson));
  }
}
