import 'package:get/get.dart';

import 'dashboard_controller.dart';

class DashboardBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<DashboardController>(
        () => DashboardController(),
      )
    ];
  }
}
