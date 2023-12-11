import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/data_table_2/page/my_paginated_data_table.dart';

class DataTableView extends StatelessWidget {
  const DataTableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyPaginatedDataTable(),
      ),
    );
  }
}
