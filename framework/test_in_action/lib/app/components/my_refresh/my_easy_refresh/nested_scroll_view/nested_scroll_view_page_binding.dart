import 'package:get/get.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/quiz_entity.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/sample_get_page_logic.dart';

class NestedScrollViewPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SampleGetPageLogic<QuizEntity>(), tag: "nested sample 1");
    print('--------------SampleGetPageLogic put success');
  }
}
