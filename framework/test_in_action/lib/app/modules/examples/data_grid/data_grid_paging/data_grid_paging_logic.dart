import 'package:get/get.dart';
import 'package:test_in_action/app/components/data_grid/page/page_data_grid_source.dart';
import 'package:test_in_action/models/foo/foo_user_entity.dart';

import 'components/sample_data_source.dart';

class SampleDataGridPagingLogic extends GetxController {
  SampleDataGridPagingLogic();

  static String get tag => "data grid example 1";

  PageDataGridSource<FooUserEntity> get dataSource =>
      Get.find<SampleDataSource>(tag: tag);
}
