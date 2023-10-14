import 'package:flutter_easyloading/flutter_easyloading.dart';

class TipsUtil {
  static void showLoading({String status = 'loading...'}) {
    EasyLoading.show(status: status);
  }

  static void dismiss({animation = true}) {
    EasyLoading.dismiss(animation: animation);
  }

  static void showToast(String status) {
    EasyLoading.showToast(status);
  }
}
