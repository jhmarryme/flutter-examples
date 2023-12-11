import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:test_in_action/app/components/data_grid/page/page_data_grid.dart';
import 'package:test_in_action/common/http/dio_utils.dart';
import 'package:test_in_action/common/http/request_helper.dart';
import 'package:test_in_action/models/foo/foo_user_entity.dart';

class FooDataGridPagingDataSource extends PageDataGridSource<FooUserEntity> {
  /// 需要自己定义
  List<DataGridRow> _dataGridRows = [];

  /// 需要重写该方法
  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  List<GridColumn> get columns {
    return [
      GridColumn(
          columnName: 'id',
          label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerRight,
              child: const Text('ID'))),
      GridColumn(
          columnName: 'name',
          label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: const Text('Name'))),
      GridColumn(
          columnName: 'age',
          width: 120,
          label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: const Text('Age'))),
    ];
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.columnName == 'id') {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerRight,
            child: Text(
              dataGridCell.value.toString(),
              overflow: TextOverflow.ellipsis,
            ),
          );
        } else if (dataGridCell.columnName == 'name') {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis,
              ));
        } else {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis,
              ));
        }
      }).toList(),
    );
  }

  @override
  void buildDataGridRows() {
    _dataGridRows = records
        .map<DataGridRow>((record) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'id', value: record.id),
              DataGridCell<String>(columnName: 'name', value: record.name),
              DataGridCell<int>(columnName: 'age', value: record.age),
            ]))
        .toList(growable: false);
  }

  @override
  Future<void> requestData() async {
    RequestHelper.requestPageNetwork<FooUserEntity>(
      Method.post,
      params: pageRequest.toJson(),
      url:
          "https://console-mock.apipost.cn/mock/e090c5f3-73d8-4738-b3d8-6beef69b00dc/v1/order/order",
      onSuccess: (data) {
        onFinishRequest(data);
      },
    );
    // onFinishRequest(await FooDao.pageUser(pageRequest));
  }
}
