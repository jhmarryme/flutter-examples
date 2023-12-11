import 'package:get/get.dart';

import 'get_helper_interface.dart';

extension GetNavigation on GetHelperInterface {
  ///The horizontal extent of this size.
  double get width => Get.width;

  ///The vertical extent of this size
  double get height => Get.height;
}
