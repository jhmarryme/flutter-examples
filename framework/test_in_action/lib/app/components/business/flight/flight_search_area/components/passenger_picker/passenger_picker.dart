import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/bottom_sheet/modal_bottom_sheet_builder.dart';
import 'package:test_in_action/app/components/spin_box/spin_box_component.dart';
import 'package:test_in_action/common/constants/colors.dart';

import 'passenger_picker_state.dart';

/// 乘客选择器, 点击后弹出底部弹窗
/// 默认展示效果为一个文本button
/// 默认值为1成人, 0婴儿, 0行李
class PassengerPickerButton extends StatelessWidget {
  const PassengerPickerButton({super.key, required this.state});

  final PickerButtonState state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var textStyle = TextStyle(fontSize: 15.spMin, color: ColorStyle.kGrey600);
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: ColorStyle.kGrey200,
            elevation: 0),
        onPressed: () => openBottomSheet(context),
        child: Row(
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(right: 4.spMin),
                    child: Icon(FontAwesomeIcons.userGroup,
                        size: 15.spMin, color: ColorStyle.kGrey600)),
                Text(state.adultsState.currentValue.toString(),
                    style: textStyle),
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 6.spMin),
                    padding: EdgeInsets.only(right: 4.spMin),
                    child: Icon(Icons.child_friendly_sharp,
                        size: 15.spMin, color: ColorStyle.kGrey600)),
                Text(state.infantsState.currentValue.toString(),
                    style: textStyle)
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 6.spMin),
                    padding: EdgeInsets.only(right: 4.spMin),
                    child: Icon(FontAwesomeIcons.suitcase,
                        size: 15.spMin, color: ColorStyle.kGrey600)),
                Text(state.baggageState.currentValue.toString(),
                    style: textStyle)
              ],
            ),
          ],
        ),
      );
    });
  }

  void openBottomSheet(BuildContext context) {
    ModalBottomSheetBuilder.showDefault(
      context,
      child: Container(
        height: 0.7.sh,
        margin: EdgeInsets.only(top: 0.03.sh, left: 0.07.sw, right: 0.07.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Passengers', style: TextStyle(fontSize: 16)),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Column(
                    children: [
                      NumberSpinBoxComponent(
                          labelText: 'Adults',
                          iconData: FontAwesomeIcons.user,
                          state: state.adultsState),
                      NumberSpinBoxComponent(
                          labelText: 'Infants',
                          iconData: FontAwesomeIcons.user,
                          state: state.infantsState),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
