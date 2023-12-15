import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/dao/search/city_entity.dart';
import 'package:test_in_action/app/dao/search/search_request_helper.dart';
import 'package:test_in_action/common/builder/modal_bottom_sheet_builder.dart';
import 'package:test_in_action/common/constants/colors.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';

import 'choose_city_text_inkwell_state.dart';

class ChooseCityTextInkWell<State extends ChooseCityTextInkWellState>
    extends StatelessWidget {
  const ChooseCityTextInkWell({super.key, required this.state});

  final State state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
          state.textEditingController.text = state.chosenCity;
          ModalBottomSheetBuilder.showCenterSheet(
            context,
            child: TypeAheadField<CityEntity>(
              suggestionsCallback: (search) async =>
                  await SearchRequestHelper.pageUser(search),
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
