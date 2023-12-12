import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/get/get_builder_view.dart';
import 'package:test_in_action/app/components/search/search_modal_bootm_sheet/search_modal_bottom_sheet_logic.dart';
import 'package:test_in_action/app/components/search/search_modal_bootm_sheet/search_modal_bottom_sheet_view.dart';
import 'package:test_in_action/common/constants/colors.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';

import 'search_home_logic.dart';

class SearchHomeView extends GetBuilderView<SearchHomeLogic> {
  SearchHomeView({super.key});

  @override
  void beforeBuild() {
    Get.put(SearchHomeLogic());
    Get.put(SearchModalBottomSheetLogic());
  }

  @override
  Widget doBuild(BuildContext context) {
    final state = Get.find<SearchHomeLogic>().state;
    return Material(
      child: Scaffold(
        body: Container(
          width: 1.sw,
          height: 1.sh,
          color: ColorStyle.kGrey100,
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                alignment: Alignment.bottomLeft,
                width: 230,
                height: 1.sh * 0.2,
                child: Text(
                  SearchHomeStrings.travelTheWorldMadeSimple.tr,
                  style: TextStyle(fontSize: 28, color: ColorStyle.kGrey600),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: ColorStyle.kWhite,
                    borderRadius: BorderRadiusDirectional.circular(10.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 1.sh * 0.15,
                        padding: EdgeInsets.only(left: 1.sw * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //Tim dia diem
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Icon(
                                              FontAwesomeIcons.locationDot,
                                              color: ColorStyle.kGrey400),
                                        ),
                                        Container(
                                          child: Image(
                                              image: AssetImage(
                                                  'assets/icons/Line.png')),
                                        ),
                                        Container(
                                          child: Transform.rotate(
                                            angle: pi / 2,
                                            child: Icon(Icons.flight,
                                                color: ColorStyle.kGrey400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 1.sh * 0.03,
                                          child: SearchModalBottomSheetPage(),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Container(
                                          height: 1.sh * 0.03,
                                          // child: Destination(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // icon doi vi tri
                            Container(
                                // child: firstChild(),
                                ),
                          ],
                        ),
                      ),

                      // Ngay di va ngay ve
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 1.sh * 0.6,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: ColorStyle.kGrey100,
                            borderRadius:
                                BorderRadiusDirectional.circular(10.0),
                          ),
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
