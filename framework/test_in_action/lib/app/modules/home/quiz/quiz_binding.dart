import 'package:get/get.dart';

import 'quiz_controller.dart';

class QuizBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<QuizController>(
        () => QuizController(),
      )
    ];
  }
}
