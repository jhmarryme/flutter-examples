import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

enum ChosenType {
  // 单程
  oneWay("One way", FontAwesomeIcons.rightLong),
  // 多程
  multipleWays("Multiple Ways", FontAwesomeIcons.rightLeft),
  // 往返
  roundWay("Round way", FontAwesomeIcons.arrowsSplitUpAndLeft);

  final String value;
  final IconData iconData;

  const ChosenType(this.value, this.iconData);
}

class ChooseTypeState {
  final chosenType = ChosenType.oneWay.obs;
}
