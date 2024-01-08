import 'package:get/get.dart';
import 'package:test_in_action/app/components/business/flight/flight_search_area/components/choose_city_text_inkwell/city_info_entity.dart';
import 'package:test_in_action/app/components/business/flight/flight_search_area/flight_search_area_state.dart';
import 'package:test_in_action/app/dao/search/search_request_helper.dart';

class SearchHomeLogic extends GetxController {
  final String flightSearchAreaTag = "flightSearchAreaTag-searchHome";

  FlightSearchAreaState get flightSearchState =>
      Get.find(tag: flightSearchAreaTag);

  Future<List<CityInfoEntity>> searchCity(String keyword) async {
    return await SearchRequestHelper.searchCity(keyword);
  }
}
