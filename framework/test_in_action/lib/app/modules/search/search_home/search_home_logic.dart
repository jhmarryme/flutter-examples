import 'package:get/get.dart';
import 'package:test_in_action/app/dao/search/city_entity.dart';

import 'search_home_state.dart';

class SearchHomeLogic extends GetxController {
  final SearchHomeState state = SearchHomeState();

  /// 交换from/to 选择器的值
  void swapCity() {
    bool tempChosen = state.fromCityState.chosen.value;
    final tempJson = state.fromCityState.data.value.toJson();

    state.fromCityState.chosen.value = state.toCityState.chosen.value;
    state.fromCityState.save(state.toCityState.data.value);

    state.toCityState.chosen.value = tempChosen;
    state.toCityState.save(CityEntity.fromJson(tempJson));
  }
}
