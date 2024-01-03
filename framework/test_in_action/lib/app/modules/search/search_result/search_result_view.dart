import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:test_in_action/app/components/bottom_sheet/modal_bottom_sheet_builder.dart';
import 'package:test_in_action/app/modules/search/search_home/filter.dart';
import 'package:test_in_action/app/modules/search/search_result/flight_search_param.dart';
import 'package:test_in_action/utils/log_utils.dart';

import 'search_result_logic.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final extraParam = GoRouterState.of(context).extra as FlightSearchParam;
    LogUtil.d("$extraParam");
    var logic = SearchResultLogic();
    Get.put(logic);
    logic.fetchFlight(extraParam);
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SearchResultView'),
          actions: [
            IconButton(
              onPressed: () {
                ModalBottomSheetBuilder.showDefault(
                  context,
                  child: Filter(),
                );
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: Text('SearchResultView'),
          ),
        ),
      ),
    );
  }
}
