import 'dart:convert';

import 'package:in_action/common/http/model/order_item_entity.dart';
import 'package:in_action/common/http/model/paging_data_entity.g.dart';

export 'package:in_action/common/http/model/paging_data_entity.g.dart';

class PagingDataEntity<T> {
  int? current;
  int? size;
  int? total;
  int? maxLimit;
  List<OrderItemEntity>? orders;
  List<T>? records;

  PagingDataEntity();

  factory PagingDataEntity.fromJson(Map<String, dynamic> json) =>
      $PagingDataEntityFromJson<T>(json);

  Map<String, dynamic> toJson() => $PagingDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
