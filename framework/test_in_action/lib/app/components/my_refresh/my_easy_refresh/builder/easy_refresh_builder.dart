import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';

class EasyRefreshFooter {
  static ClassicFooter classicFooterDefault() {
    return ClassicFooter(
      position: IndicatorPosition.locator,
      dragText: 'Pull to load'.tr,
      armedText: 'Release ready'.tr,
      readyText: 'Loading...'.tr,
      processingText: 'Loading...'.tr,
      processedText: 'Succeeded'.tr,
      noMoreText: 'No more'.tr,
      failedText: 'Failed'.tr,
      messageText: 'Last updated at %T'.tr,
    );
  }
}

class EasyRefreshHeader {
  static ClassicHeader classicHeaderDefault() {
    return ClassicHeader(
      dragText: 'Pull to refresh'.tr,
      armedText: 'Release ready'.tr,
      readyText: 'Refreshing...'.tr,
      processingText: 'Refreshing...'.tr,
      processedText: 'Succeeded'.tr,
      noMoreText: 'No more'.tr,
      failedText: 'Failed'.tr,
      messageText: 'Last updated at %T'.tr,
      safeArea: false,
    );
  }
}
