import 'package:get/get.dart';
import 'package:test_in_action/services/global_service.dart';

import 'settings_logic.dart';

class SettingsBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<SettingsLogic>(
        () => SettingsLogic(),
      ),
      Bind.lazyPut<GlobalService>(
        () => GlobalService(),
      )
    ];
  }
}
