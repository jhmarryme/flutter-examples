import 'package:get/get.dart';
import 'package:test_in_action/app/components/data_grid/page/page_data_grid_source.dart';
import 'package:test_in_action/models/foo/foo_user_entity.dart';

import 'foo_data_grid_paging_data_source.dart';

class FooDataGridPagingLogic extends GetxController {
  FooDataGridPagingLogic();

  static String get tag => "data grid example 1";

  PageDataGridSource<FooUserEntity> get dataSource =>
      Get.find<FooDataGridPagingDataSource>(tag: tag);
}
