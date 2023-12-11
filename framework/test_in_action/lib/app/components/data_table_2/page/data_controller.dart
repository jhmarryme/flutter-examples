import 'package:get/get.dart';

import 'data_model.dart';

class DataController extends GetxController {
  final data = <DataModel>[
    DataModel(name: 'Alice', age: 30),
    DataModel(name: 'Bob', age: 25),
    // Add more data here
  ].obs;

  // Add your data loading logic here
  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate async data loading
    // Update this.data with the loaded data
    this.data.addAll([
      DataModel(name: 'Charlie', age: 35),
      // Add more loaded data
    ]);
  }
}
