import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/business/search/choose_city_text_inkwell/choose_city_text_inkwell.dart';
import 'package:test_in_action/app/components/datetime/calender_date_picker2/date_picker_button/date_picker_dialog_button.dart';
import 'package:test_in_action/app/modules/search/choose_type/choose_type_view.dart';
import 'package:test_in_action/app/modules/search/search_result/flight_search_param.dart';
import 'package:test_in_action/app/routes/parts/go_router_navigation_helper.dart';
import 'package:test_in_action/common/constants/colors.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';

import 'search_home_logic.dart';

class SearchHomeView extends StatefulWidget {
  const SearchHomeView({super.key});

  @override
  State<SearchHomeView> createState() => _SearchHomeViewState();
}

class _SearchHomeViewState extends State<SearchHomeView>
    with TickerProviderStateMixin {
  final controller = SearchHomeLogic();

  late Animation _arrowAnimation;
  late AnimationController _arrowAnimationController;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
  }

  @override
  Widget build(BuildContext context) {
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
                    Container(),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Icon(FontAwesomeIcons.locationDot,
                            color: ColorStyle.kGrey400),
                        const Image(image: AssetImage('assets/icons/Line.png')),
                        Transform.rotate(
                          angle: pi / 2,
                          child: const Icon(Icons.flight,
                              color: ColorStyle.kGrey400),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.spMin),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 1.sh * 0.03,
                            child: ChooseCityTextInkWell(
                                state: controller.state.fromCityState),
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                            height: 1.sh * 0.03,
                            child: ChooseCityTextInkWell(
                                state: controller.state.toCityState),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // icon doi vi tri
                InkWell(
                  child: AnimatedBuilder(
                    animation: _arrowAnimation,
                    builder: (context, child) => Transform.rotate(
                      angle: _arrowAnimation.value,
                      child: Icon(Icons.autorenew_rounded,
                          color: ColorStyle.kBlue, size: 30.spMin),
                    ),
                  ),
                  onTap: () {
                    _arrowAnimationController.isCompleted
                        ? _arrowAnimationController.reverse()
                        : _arrowAnimationController.forward();
                    controller.swapCity();
                  },
                ),
              ],
            ),
          ),
          DatePickerButton(state: controller.state.datePickerState),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              final extra = FlightSearchParam("123", "123");
              GoRouterNavigationHelper.goNamedWithContext(
                context,
                SearchRouteDefine.searchResult.name,
                extra: extra,
              );
            },
          ),
        ],
      ),
    );
  }
}
