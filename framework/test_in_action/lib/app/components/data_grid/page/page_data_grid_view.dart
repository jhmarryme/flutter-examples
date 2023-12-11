import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:test_in_action/utils/log_utils.dart';

import 'page_data_grid_source.dart';

/// 提供一个简单的分页表格,如果需要更多功能可以在其基础上修改
class PageDataGridView<DataSource extends PageDataGridSource>
    extends StatelessWidget {
  const PageDataGridView({Key? key, required this.tag}) : super(key: key);
  static const double dataPagerHeight = 60;

  final String tag;

  DataSource get dataSource => Get.find<DataSource>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight - dataPagerHeight,
              width: constraints.maxWidth,
              child: Obx(() {
                return SfDataGrid(
                  source: dataSource,
                  rowsPerPage: dataSource.rowsPerPage.value,
                  allowSorting: true,
                  columnWidthMode: ColumnWidthMode.fill,
                  columns: dataSource.columns,
                );
              }),
            ),
            Container(
              height: dataPagerHeight,
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.surface.withOpacity(0.12),
                border: Border(
                  top: BorderSide(
                      width: .5,
                      color: Get.theme.colorScheme.onSurface.withOpacity(0.12)),
                ),
              ),
              child: Center(
                child: SfDataPagerTheme(
                  data: SfDataPagerThemeData(
                    brightness: Get.theme.brightness,
                    selectedItemColor: Get.theme.colorScheme.background,
                  ),
                  child: Obx(() {
                    return SfDataPager(
                      delegate: dataSource,
                      availableRowsPerPage: const <int>[15, 20, 25],
                      pageCount: dataSource.pageCount.value,
                      onRowsPerPageChanged: (int? rowsPerPage) {
                        LogUtil.d(
                            "onRowsPerPageChanged rowsPerPage :$rowsPerPage");
                      },
                      onPageNavigationEnd: (pageIndex) {
                        LogUtil.d(
                            "onPageNavigationEnd rowsPerPage :$pageIndex");
                      },
                      onPageNavigationStart: (pageIndex) {
                        LogUtil.d(
                            "onPageNavigationStart rowsPerPage :$pageIndex");
                      },
                    );
                  }),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
