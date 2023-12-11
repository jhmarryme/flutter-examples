import 'package:get/get.dart';

import 'components/sample_data_source.dart';
import 'data_grid_paging_logic.dart';

class DataGridPagingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SampleDataSource(),
      tag: SampleDataGridPagingLogic.tag,
    );
    Get.lazyPut(
      () => SampleDataGridPagingLogic(),
      tag: SampleDataGridPagingLogic.tag,
    );
  }
}
