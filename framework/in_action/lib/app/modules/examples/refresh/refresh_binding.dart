import 'package:get/get.dart';
import 'package:in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/quiz_entity.dart';
import 'package:in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/sample_get_page_logic.dart';

import 'refresh_controller.dart';

class RefreshBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<RefreshController>(
        () => RefreshController(),
      ),
      Bind.lazyPut<SampleGetPageLogic<QuizEntity>>(
        () => SampleGetPageLogic<QuizEntity>(),
      )
    ];
  }
}
