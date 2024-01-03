import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/spin_box/spin_box_component.dart';
import 'package:test_in_action/common/constants/colors.dart';

import 'picker_button_state.dart';

class PickerButtonComponent extends StatelessWidget {
  const PickerButtonComponent({Key? key, required this.state})
      : super(key: key);

  final PickerButtonState state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var textStyle = TextStyle(fontSize: 15.spMin, color: ColorStyle.kGrey600);
      return ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: ColorStyle.kWhite,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            builder: (BuildContext context) {
              return BottomSheet(
                onClosing: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter mystate) {
                      return Container(
                        height: 0.7.sh,
                        margin: EdgeInsets.only(
                            top: 0.03.sh, left: 0.07.sw, right: 0.07.sw),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Passengers
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: const Text('Passengers',
                                      style: TextStyle(fontSize: 16)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  child: Column(
                                    children: <Widget>[
                                      NumberSpinBoxComponent(
                                        labelText: 'Adults',
                                        iconData: FontAwesomeIcons.user,
                                        state: state.adultsState,
                                      ),
                                      NumberSpinBoxComponent(
                                        labelText: 'Infants',
                                        iconData: FontAwesomeIcons.user,
                                        state: state.infantsState,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          backgroundColor: ColorStyle.kGrey200,
          elevation: 0,
        ),
        child: Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 4.spMin),
                  child: Icon(
                    FontAwesomeIcons.userGroup,
                    size: 15.spMin,
                    color: ColorStyle.kGrey600,
                  ),
                ),
                Text(
                  state.adultsState.currentValue.toString(),
                  style: textStyle,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 6.spMin),
                  padding: EdgeInsets.only(right: 4.spMin),
                  child: Icon(
                    Icons.child_friendly_sharp,
                    size: 15.spMin,
                    color: ColorStyle.kGrey600,
                  ),
                ),
                Text(
                  state.infantsState.currentValue.toString(),
                  style: textStyle,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 6.spMin),
                  padding: EdgeInsets.only(right: 4.spMin),
                  child: Icon(
                    FontAwesomeIcons.suitcase,
                    size: 15.spMin,
                    color: ColorStyle.kGrey600,
                  ),
                ),
                Text(
                  state.baggageState.currentValue.toString(),
                  style: textStyle,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
