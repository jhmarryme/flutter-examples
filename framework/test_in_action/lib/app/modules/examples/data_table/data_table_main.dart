import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: DataTableView(),
  ));
}

class DataTableView extends StatelessWidget {
  const DataTableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal PaginatedDataTable'),
      ),
      body: PaginatedDataTable(
        header: const Text('Items'),
        rowsPerPage: 5,
        columns: const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Price')),
        ],
        source: MyData(),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> _data = [
    {'id': 1, 'name': 'Item 1', 'price': 10.0},
    {'id': 2, 'name': 'Item 2', 'price': 20.0},
    {'id': 3, 'name': 'Item 3', 'price': 30.0},
    {'id': 4, 'name': 'Item 4', 'price': 40.0},
    {'id': 5, 'name': 'Item 5', 'price': 50.0},
    {'id': 6, 'name': 'Item 6', 'price': 60.0},
    // Add more data as needed
  ];

  @override
  DataRow getRow(int index) {
    if (index >= _data.length) return DataRow(cells: []);

    final item = _data[index];

    return DataRow(cells: [
      DataCell(Text(item['id'].toString())),
      DataCell(Text(item['name'].toString())),
      DataCell(Text(item['price'].toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
