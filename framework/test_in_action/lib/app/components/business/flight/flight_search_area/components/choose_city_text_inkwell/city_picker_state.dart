import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'city_info_entity.dart';

typedef CitySearchFunction = Future<List<CityInfoEntity>> Function(
    String keyword);

class CityPickerState {
  final chosen = false.obs;

  final data = CityInfoEntity().obs;

  final textEditingController = TextEditingController();

  final CitySearchFunction chooseCityFunction;

  String get chosenCity => data.value.city ?? '';

  CityPickerState(this.chooseCityFunction);

  void clear() {
    chosen.value = false;
    data.value = CityInfoEntity();
    data.refresh();
  }

  void save(CityInfoEntity city) {
    data.value = city;
  }

  void choseCity(CityInfoEntity city) {
    chosen.value = true;
    save(city);
  }
}
