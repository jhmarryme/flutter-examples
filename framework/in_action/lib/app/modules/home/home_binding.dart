import 'package:get/get.dart';

import 'home_logic.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<HomeLogic>(
        () => HomeLogic(),
      )
    ];
  }
}
