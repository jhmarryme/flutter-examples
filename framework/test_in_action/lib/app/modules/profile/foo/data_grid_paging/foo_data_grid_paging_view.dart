import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/data_grid/page/page_data_grid.dart';
import 'package:test_in_action/app/components/get/get_builder_view.dart';

import 'foo_data_grid_paging_data_source.dart';
import 'foo_data_grid_paging_logic.dart';

class FooDataGridPagingView extends GetBuilderView<FooDataGridPagingLogic> {
  const FooDataGridPagingView({Key? key}) : super(key: key);

  @override
  String? get tag => FooDataGridPagingLogic.tag;

  @override
  void beforeBuild() {
    Get.lazyPut(
      () => FooDataGridPagingDataSource(),
      tag: FooDataGridPagingLogic.tag,
    );
    Get.lazyPut(
      () => FooDataGridPagingLogic(),
      tag: FooDataGridPagingLogic.tag,
    );
  }

  @override
  Widget doBuild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageDataGridView<FooDataGridPagingDataSource>(
        tag: FooDataGridPagingLogic.tag,
      ),
    );
  }
}
