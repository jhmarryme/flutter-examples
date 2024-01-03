import 'package:get/get.dart';
import 'package:test_in_action/app/dao/search/search_request_helper.dart';
import 'package:test_in_action/app/modules/search/search_result/flight_search_param.dart';
import 'package:test_in_action/utils/log_utils.dart';

import 'search_result_state.dart';

class SearchResultLogic extends GetxController {
  final SearchResultState state = SearchResultState();

  void fetchFlight(FlightSearchParam param) async {
    final result = await SearchRequestHelper.queryFlight(
        param.departureCity, param.arrivalCity);
    LogUtil.d("$result");
  }
}
