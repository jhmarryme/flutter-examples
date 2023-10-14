import 'package:in_action/app/json/base/json_convert_content.dart';
import 'package:in_action/common/http/model/order_item_entity.dart';

OrderItemEntity $OrderItemEntityFromJson(Map<String, dynamic> json) {
  final OrderItemEntity orderItemEntity = OrderItemEntity();
  final String? column = jsonConvert.convert<String>(json['column']);
  if (column != null) {
    orderItemEntity.column = column;
  }
  final bool? asc = jsonConvert.convert<bool>(json['asc']);
  if (asc != null) {
    orderItemEntity.asc = asc;
  }
  return orderItemEntity;
}

Map<String, dynamic> $OrderItemEntityToJson(OrderItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['column'] = entity.column;
  data['asc'] = entity.asc;
  return data;
}

extension OrderItemEntityExtension on OrderItemEntity {
  OrderItemEntity copyWith({
    String? column,
    bool? asc,
  }) {
    return OrderItemEntity()
      ..column = column ?? this.column
      ..asc = asc ?? this.asc;
  }
}
