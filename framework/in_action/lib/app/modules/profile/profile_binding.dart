import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfileBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<ProfileController>(
        () => ProfileController(),
      )
    ];
  }
}
