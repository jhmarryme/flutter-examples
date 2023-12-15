import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/dao/search/city_entity.dart';

class ChooseCityTextInkWellState {
  final chosen = false.obs;

  final data = CityEntity().obs;

  final textEditingController = TextEditingController();

  String get chosenCity => data.value.city ?? '';

  void clear() {
    chosen.value = false;
    data.value = CityEntity();
    data.refresh();
  }

  void save(CityEntity city) {
    data.value = city;
  }

  void choseCity(CityEntity city) {
    chosen.value = true;
    save(city);
  }
}
