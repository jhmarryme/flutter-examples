import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/datetime/calender_date_picker2/dialog_button/dialog_button_helper.dart';
import 'package:test_in_action/app/components/get/get_builder_view.dart';
import 'package:test_in_action/app/components/search/search_modal_bootm_sheet/choose_city_input_view.dart';
import 'package:test_in_action/app/modules/search/choose_type/choose_type_view.dart';
import 'package:test_in_action/common/constants/colors.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';

import 'search_home_logic.dart';

class SearchHomeView extends GetBuilderView<SearchHomeLogic> {
  const SearchHomeView({super.key});

  @override
  void beforeBuild() {
    Get.put(SearchHomeLogic());
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
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                alignment: Alignment.bottomLeft,
                width: 230.spMin,
                height: 1.sh * 0.2,
                child: Text(
                  SearchHomeStrings.travelTheWorldMadeSimple.tr,
                  style:
                      TextStyle(fontSize: 28.spMin, color: ColorStyle.kGrey600),
                ),
              ),
              searchFlight(context),
              Container(
                margin: EdgeInsets.only(
                  left: 1.sw * 0.02,
                  right: 1.sw * 0.06,
                  bottom: 20.spMin,
                  top: 20.spMin,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        color: const Color.fromRGBO(112, 112, 112, 0.0),
                        child: ChooseTypeComponent(
                            state: controller.state.chooseTypeState)),
                    Container(
                        color: const Color.fromRGBO(112, 112, 112, 0.0),
                        child: ChooseTypeComponent(
                            state: controller.state.chooseTypeState)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container searchFlight(BuildContext context) {
    controller.initializeDatePicker(context);

    return Container(
      padding: EdgeInsets.all(15.spMin),
      decoration: BoxDecoration(
        color: ColorStyle.kWhite,
        borderRadius: BorderRadiusDirectional.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 1.sh * 0.15,
            padding: EdgeInsets.only(left: 1.sw * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Tim dia diem
                Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Icon(FontAwesomeIcons.locationDot,
                              color: ColorStyle.kGrey400),
                          const Image(
                              image: AssetImage('assets/icons/Line.png')),
                          Transform.rotate(
                            angle: pi / 2,
                            child: const Icon(Icons.flight,
                                color: ColorStyle.kGrey400),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.spMin),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 1.sh * 0.03,
                            child: ChooseCityInputComponent(
                              logicTag: controller.state.fromCityLogicTag,
                            ),
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                            height: 1.sh * 0.03,
                            child: ChooseCityInputComponent(
                              logicTag: controller.state.toCityLogicTag,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // icon doi vi tri
                InkWell(
                  child: Icon(Icons.autorenew_rounded,
                      color: ColorStyle.kBlue, size: 30.spMin),
                  onTap: () => controller.swapCity(),
                ),
              ],
            ),
          ),
          CalendarDialogButtonHelper.buildDefaultCalendarDialogButton(
              context, controller.state.datePickerState!),
        ],
      ),
    );
  }
}
