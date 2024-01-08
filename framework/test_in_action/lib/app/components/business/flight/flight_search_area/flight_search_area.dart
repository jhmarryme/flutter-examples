import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/business/flight/flight_search_area/components/passenger_picker/passenger_picker.dart';
import 'package:test_in_action/app/components/datetime/calender_date_picker2/date_picker_button/date_picker_dialog_button.dart';
import 'package:test_in_action/app/components/picker/custom_picker/bottom_sheet_item_picker/item_picker.dart';
import 'package:test_in_action/common/constants/colors.dart';

import 'components/choose_city_text_inkwell/city_picker.dart';
import 'flight_search_area_logic.dart';

/// 航班搜索区域
class FlightSearchArea extends StatefulWidget {
  final String tag;

  const FlightSearchArea({super.key, required this.tag});

  @override
  State<FlightSearchArea> createState() => _FlightSearchAreaState();
}

class _FlightSearchAreaState extends State<FlightSearchArea>
    with TickerProviderStateMixin {
  late Animation _arrowAnimation;

  late AnimationController _arrowAnimationController;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<FlightSearchAreaLogic>(tag: widget.tag);
    final state = logic.state;
    return Column(
      children: <Widget>[
        Container(
          height: 1.sh * 0.15,
          padding: EdgeInsets.only(left: 1.sw * 0.025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Tim dia diem
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                          size: 20.spMin,
                          FontAwesomeIcons.locationDot,
                          color: ColorStyle.kGrey400),
                      const Expanded(
                          child: Image(
                              image: AssetImage('assets/icons/Line.png'))),
                      Transform.rotate(
                          angle: pi / 2,
                          child: Icon(
                              size: 20.spMin,
                              Icons.flight,
                              color: ColorStyle.kGrey400)),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.spMin),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 1.sh * 0.03,
                            child: CityPickerTextInkWell(
                                state: state.fromCityPickerState)),
                        Expanded(child: Container()),
                        SizedBox(
                            height: 1.sh * 0.03,
                            child: CityPickerTextInkWell(
                                state: state.toCityPickerState)),
                      ],
                    ),
                  ),
                ],
              ),

              InkWell(
                child: AnimatedBuilder(
                  animation: _arrowAnimation,
                  builder: (context, child) => Transform.rotate(
                      angle: _arrowAnimation.value,
                      child: Icon(Icons.autorenew_rounded,
                          color: ColorStyle.kBlue, size: 30.spMin)),
                ),
                onTap: () {
                  /// 旋转动画
                  _arrowAnimationController.isCompleted
                      ? _arrowAnimationController.reverse()
                      : _arrowAnimationController.forward();
                  logic.swapCity();
                },
              ),
            ],
          ),
        ),
        DatePickerButton(state: state.datePickerState),
        Container(
          margin: EdgeInsets.only(
              left: 1.sw * 0.02,
              right: 1.sw * 0.06,
              bottom: 20.spMin,
              top: 20.spMin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  color: const Color.fromRGBO(112, 112, 112, 0.0),
                  child: BottomSheetItemPicker(
                      title: '请选择', state: state.tripTypePickerState)),
              PassengerPickerButton(state: state.passengerPickerState),
            ],
          ),
        )
      ],
    );
  }
}
