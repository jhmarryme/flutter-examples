import 'package:get/get.dart';

import 'refresh_controller.dart';

class RefreshBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<RefreshController>(
        () => RefreshController(),
      ),
      // Bind.lazyPut<SampleGetPageLogic<QuizEntity>>(
      //   () => SampleGetPageLogic<QuizEntity>(),
      // )
    ];
  }
}
