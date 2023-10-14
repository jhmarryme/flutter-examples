import 'dart:convert';

import 'package:test_in_action/app/json/base/json_field.dart';
import 'package:test_in_action/app/json/order_item_entity.g.dart';

export 'package:test_in_action/app/json/order_item_entity.g.dart';

@JsonSerializable()
class OrderItemEntity {
  String? column;
  bool? asc;

  OrderItemEntity();

  factory OrderItemEntity.fromJson(Map<String, dynamic> json) =>
      $OrderItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $OrderItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
