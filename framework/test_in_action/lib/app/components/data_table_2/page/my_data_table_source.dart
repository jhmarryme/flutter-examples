import 'dart:math';

import 'package:flutter/material.dart';

class MyDataTableSource extends DataTableSource {
  final List<Map<String, dynamic>> _sourceData = List.generate(
      200,
      (index) => {
            "avatar": (index % 3 == 1)
                ? 'assets/images/avatar.png'
                : (index % 3 == 2)
                    ? 'assets/images/avatar.png'
                    : 'assets/images/avatar.png',
            "id": (index + 1),
            "name": "Item Name ${(index + 1)}",
            "price": Random().nextInt(10000),
            "no.": Random().nextInt(10000),
            "address": (index % 3 == 1)
                ? 'Beijing'
                : (index % 3 == 2)
                    ? 'New York'
                    : 'Los Angeles'
          });

  bool get isRowCountApproximate => false;

  int get rowCount => _sourceData.length;

  int get selectedRowCount => 0;

  DataRow getRow(int index) => DataRow(cells: [
        DataCell(CircleAvatar(
            backgroundImage: AssetImage(_sourceData[index]["avatar"]))),
        DataCell(Text(_sourceData[index]['id'].toString())),
        DataCell(Text(_sourceData[index]['name'])),
        DataCell(Text('\$ ${_sourceData[index]['price']}')),
        DataCell(Text(_sourceData[index]['no.'].toString())),
        DataCell(Text(_sourceData[index]['address'].toString()))
      ]);
}
