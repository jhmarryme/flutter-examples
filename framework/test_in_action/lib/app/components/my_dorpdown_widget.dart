import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';

class MyDropdownWidget<K> extends StatelessWidget {
  // key-value， 下拉显示内容,  key为需要显示的内容, value为选择时的selectedValue
  final Map<String, K> map;

  // 默认选择的value
  final K selectedValue;

  // value变更回调
  final Function(K? value)? onChanged;

  const MyDropdownWidget({
    Key? key,
    required this.map,
    required this.selectedValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<K>(
      isExpanded: true,
      hint: Text(
        Strings.hello.tr,
        style: TextStyle(fontSize: 14, color: Get.theme.hintColor),
      ),
      items: map.entries
          .map((e) => DropdownMenuItem<K>(
                value: e.value,
                child: Text(e.key.tr, style: const TextStyle(fontSize: 14)),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (value) => onChanged?.call(value),
      buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 170),
      menuItemStyleData: const MenuItemStyleData(height: 40),
    );
  }
}
