import 'package:flutter/material.dart';

import 'my_data_table_source.dart';

class MyPaginatedDataTable extends StatelessWidget {
  const MyPaginatedDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataTableSource _sourceData = MyDataTableSource();
    return PaginatedDataTable(
      columns: [
        DataColumn(label: Text('Avatar')),
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(
          label: Row(
            children: [
              Text('Price'),
              SizedBox(width: 5.0),
              Icon(Icons.airplanemode_active),
            ],
          ),
        ),
        DataColumn(label: Text('No.')),
        DataColumn(label: Text('Address'))
      ],
      // horizontalMargin: 200,
      source: _sourceData,
      header: Text('Flight Products'),
      actions: [Icon(Icons.refresh), Icon(Icons.clear)],
      headingRowHeight: 80.0,
    );
  }
}
