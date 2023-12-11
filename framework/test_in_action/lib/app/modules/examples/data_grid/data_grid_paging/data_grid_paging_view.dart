import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/data_grid/page/page_data_grid.dart';
import 'package:test_in_action/app/routes/backup/app_pages.dart';

import 'components/sample_data_source.dart';
import 'data_grid_paging_logic.dart';

class DataGridPagingView extends GetView<SampleDataGridPagingLogic> {
  const DataGridPagingView({Key? key}) : super(key: key);

  @override
  String? get tag => SampleDataGridPagingLogic.tag;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => SampleDataSource(),
      tag: SampleDataGridPagingLogic.tag,
    );
    Get.lazyPut(
      () => SampleDataGridPagingLogic(),
      tag: SampleDataGridPagingLogic.tag,
    );
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.toNamed(Routes.home),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: PageDataGridView<SampleDataSource>(
        tag: SampleDataGridPagingLogic.tag,
      ),
    );
  }
}
