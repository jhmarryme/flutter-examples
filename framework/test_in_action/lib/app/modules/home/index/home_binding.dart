import 'package:get/get.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/quiz_entity.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/sample_get_page_logic.dart';
import 'package:test_in_action/app/modules/examples/refresh/refresh_controller.dart';
import 'package:test_in_action/app/modules/home/dashboard/dashboard_controller.dart';
import 'package:test_in_action/app/modules/home/quiz/quiz_controller.dart';
import 'package:test_in_action/app/modules/home/settings/settings_logic.dart';
import 'package:test_in_action/services/global_service.dart';

import 'home_logic.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<DashboardController>(
        () => DashboardController(),
      ),
      Bind.lazyPut<RefreshController>(
        () => RefreshController(),
      ),
      Bind.lazyPut<SettingsLogic>(
        () => SettingsLogic(),
      ),
      Bind.lazyPut<GlobalService>(
        () => GlobalService(),
      ),
      Bind.lazyPut<QuizController>(
        () => QuizController(),
      ),
      Bind.lazyPut<SampleGetPageLogic<QuizEntity>>(
        () => SampleGetPageLogic<QuizEntity>(),
      ),
      Bind.lazyPut<HomeLogic>(
        () => HomeLogic(),
      ),
    ];
  }
}
