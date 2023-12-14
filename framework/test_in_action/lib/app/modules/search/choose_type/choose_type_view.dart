import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_in_action/common/constants/colors.dart';

import 'choose_type_state.dart';

class ChooseTypeComponent extends StatelessWidget {
  const ChooseTypeComponent({Key? key, required this.state}) : super(key: key);

  final ChooseTypeState state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ElevatedButton(
        onPressed: () {
          typeOfFlight(context);
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: ColorStyle.kGrey200,
            elevation: 0),
        child: Row(
          children: <Widget>[
            Icon(state.chosenType.value.iconData,
                size: 15.spMin, color: ColorStyle.kGrey600),
            Container(
              padding: EdgeInsets.only(left: 10.spMin),
              child: Text(
                state.chosenType.value.value,
                style:
                    TextStyle(fontSize: 15.spMin, color: ColorStyle.kGrey600),
              ),
            ),
          ],
        ),
      );
    });
  }

  void typeOfFlight(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      // backgroundColor: ColorStyle.kWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      builder: (context) => Container(
        color: ColorStyle.kWhite,
        height: 1.sh * 0.4,
        padding:
            EdgeInsets.only(top: 25.spMin, left: 10.spMin, right: 10.spMin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15.spMin),
              child: Text('Type', style: TextStyle(fontSize: 20.spMin)),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.spMin),
              width: 1.sw,
              child: Column(
                children: <Widget>[
                  TypeTravel(ChosenType.oneWay, () {
                    state.chosenType.value = ChosenType.oneWay;
                    Navigator.pop(context);
                  }),
                  SizedBox(
                    height: 5.spMin,
                  ),
                  TypeTravel(ChosenType.multipleWays, () {
                    state.chosenType.value = ChosenType.multipleWays;
                    Navigator.pop(context);
                  }),
                  SizedBox(
                    height: 5.spMin,
                  ),
                  TypeTravel(ChosenType.roundWay, () {
                    state.chosenType.value = ChosenType.roundWay;
                    Navigator.pop(context);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypeTravel extends StatelessWidget {
  final ChosenType chosenType;
  final VoidCallback? onPress;

  const TypeTravel(this.chosenType, this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorStyle.kWhite,
          elevation: 0,
          side: const BorderSide(width: 0.0, color: ColorStyle.kWhite),
        ),
        child: Row(
          children: <Widget>[
            Icon(chosenType.iconData, size: 15.spMin),
            Container(
              margin: EdgeInsets.only(left: 15.spMin),
              child:
                  Text(chosenType.value, style: TextStyle(fontSize: 15.spMin)),
            ),
          ],
        ),
      ),
    );
  }
}
