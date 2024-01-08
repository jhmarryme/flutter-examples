import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/bottom_sheet/modal_bottom_sheet_builder.dart';
import 'package:test_in_action/app/components/business/flight/flight_search_area/components/choose_city_text_inkwell/city_info_entity.dart';
import 'package:test_in_action/common/constants/colors.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';

import 'city_picker_state.dart';

class CityPickerTextInkWell extends StatelessWidget {
  const CityPickerTextInkWell({super.key, required this.state});

  final CityPickerState state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
          state.textEditingController.text = state.chosenCity;
          ModalBottomSheetBuilder.showCenterSheet(
            context,
            child: TypeAheadField<CityInfoEntity>(
              suggestionsCallback: (keyword) async =>
                  state.chooseCityFunction.call(keyword),
              controller: state.textEditingController,
              builder: (context, textEditController, focusNode) => TextField(
                controller: textEditController,
                focusNode: focusNode,
                autofocus: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'City'),
              ),
              itemBuilder: (context, city) => ListTile(
                title: Text(city.city ?? ''),
                subtitle: Text('${city.region}-${city.province}'),
              ),
              onSelected: (city) {
                state.choseCity(city);
                Navigator.pop(context);
              },
            ),
          );
        },
        child: Text(
          state.chosen.value
              ? state.chosenCity
              : SearchHomeStrings.whereYouToGo.tr,
          style: const TextStyle(fontSize: 15, color: ColorStyle.kGrey500),
        ),
      );
    });
  }
}
