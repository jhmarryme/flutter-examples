import 'package:flutter/material.dart';
import 'package:get/get.dart';

// enum ChosenType {
//   // 单程
//   oneWay("One way", FontAwesomeIcons.rightLong),
//   // 多程
//   multipleWays("Multiple Ways", FontAwesomeIcons.rightLeft),
//   // 往返
//   roundWay("Round way", FontAwesomeIcons.arrowsSplitUpAndLeft);
//
//   final String value;
//   final IconData iconData;
//
//   const ChosenType(this.value, this.iconData);
// }

/// 选择项
class Item {
  /// 展示名称
  final String name;

  /// 实际value
  final String value;

  /// 展示图标
  final IconData iconData;

  const Item(this.name, this.value, this.iconData);
}

class ItemPickerState {
  /// 列表项数据
  final items = <Item>[].obs;

  /// 选中的项
  late final Rx<Item> chosenItem;
// TravelChosenType("value", FontAwesomeIcons.rightLeft).obs as Rx<Type>;
}
