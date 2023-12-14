import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/dao/search/city_entity.dart';
import 'package:test_in_action/app/dao/search/search_request_helper.dart';
import 'package:test_in_action/common/builder/modal_bottom_sheet_builder.dart';
import 'package:test_in_action/common/constants/colors.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';

import 'choose_city_input_logic.dart';

class ChooseCityInputComponent<Logic extends ChooseCityInputLogic>
    extends GetView<Logic> {
  const ChooseCityInputComponent(
      {required this.logicTag, this.displayText, super.key});

  final String logicTag;

  final String? displayText;

  @override
  get tag => logicTag;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
          controller.textEditingController.text =
              controller.cityEntity.value.city ?? '';
          // controller.chosen.value = false;
          searchPlace(context);
        },
        child: controller.chosen.value == false
            ? Text(displayText ?? SearchHomeStrings.whereYouToGo.tr,
                style:
                    const TextStyle(fontSize: 15, color: ColorStyle.kGrey500))
            : Text(
                controller.cityEntity.value.city ??
                    SearchHomeStrings.whereYouToGo.tr,
                style:
                    const TextStyle(fontSize: 15, color: ColorStyle.kGrey500)),
      );
    });
  }

  void searchPlace(BuildContext context) {
    ModalBottomSheetBuilder.showCenterSheet(
      context,
      child: TypeAheadField<CityEntity>(
        suggestionsCallback: (search) async {
          return await SearchRequestHelper.pageUser(search);
        },
        controller: controller.textEditingController,
        builder: (context, textEditController, focusNode) {
          return TextField(
              controller: textEditController,
              focusNode: focusNode,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'City',
              ));
        },
        itemBuilder: (context, city) {
          return ListTile(
              title: Text(city.city ?? ''),
              subtitle: Text('${city.region}-${city.province}'));
        },
        onSelected: (city) {
          controller.saveChosenCity(city);
          Navigator.pop(context);
        },
      ),
    );
  }
}
