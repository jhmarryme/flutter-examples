import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/business/flight/flight_search_area/flight_search_area.dart';
import 'package:test_in_action/app/components/business/flight/flight_search_area/flight_search_area_logic.dart';
import 'package:test_in_action/app/components/get/get_builder_view.dart';
import 'package:test_in_action/common/constants/colors.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';

import 'search_home_logic.dart';

class SearchHomeView extends GetBuilderView<SearchHomeLogic> {
  const SearchHomeView({super.key});

  @override
  void beforeBuild() {
    Get.lazyPut<SearchHomeLogic>(() => SearchHomeLogic());
    Get.lazyPut(
      () => FlightSearchAreaLogic((keyword) => controller.searchCity(keyword)),
      tag: controller.flightSearchAreaTag,
    );
  }

  @override
  Widget doBuild(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          color: ColorStyle.kGrey100,
          padding: EdgeInsets.only(left: 10.spMin, right: 10.spMin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 文字区域
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                alignment: Alignment.bottomLeft,
                width: 230.spMin,
                height: 1.sh * 0.2,
                child: Text(SearchHomeStrings.travelTheWorldMadeSimple.tr,
                    style: TextStyle(
                        fontSize: 28.spMin, color: ColorStyle.kGrey600)),
              ),
              FlightSearchArea(tag: controller.flightSearchAreaTag),
            ],
          ),
        ),
      ),
    );
  }
}
