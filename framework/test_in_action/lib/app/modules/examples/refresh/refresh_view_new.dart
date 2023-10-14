import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/quiz_entity.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/sample_get_page_logic.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/sample_get_page_view.dart';

class RefreshViewNew extends StatefulWidget {
  const RefreshViewNew({Key? key}) : super(key: key);

  @override
  _RefreshViewNewState createState() => _RefreshViewNewState();
}

class _RefreshViewNewState extends State<RefreshViewNew>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Get.put(SampleGetPageLogic<QuizEntity>());
    super.build(context);
    print("=====================");
    return const SampleGetPageView();
  }

  @override
  bool get wantKeepAlive => true;
}
