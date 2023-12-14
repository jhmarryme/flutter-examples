import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/dao/search/city_entity.dart';

class ChooseCityInputLogic extends GetxController {
  final chosen = false.obs;

  final cityEntity = CityEntity().obs;

  final textEditingController = TextEditingController();

  void cleanCity() {
    chosen.value = false;
    cityEntity.value = CityEntity();
    cityEntity.refresh();
  }

  void updateCity(CityEntity city) {
    cityEntity.update((val) {
      val?.city = city.city;
      val?.region = city.region;
      val?.province = city.province;
      val?.code = city.code;
    });
  }

  void saveChosenCity(CityEntity city) {
    chosen.value = true;
    updateCity(city);
  }
}
