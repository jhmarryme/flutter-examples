import 'package:in_action/app/json/base/json_convert_content.dart';
import 'package:in_action/common/http/model/order_item_entity.dart';
import 'package:in_action/common/http/model/paging_data_entity.dart';

PagingDataEntity<T> $PagingDataEntityFromJson<T>(Map<String, dynamic> json) {
  final PagingDataEntity<T> pagingDataEntity = PagingDataEntity<T>();
  final int? current = jsonConvert.convert<int>(json['current']);
  if (current != null) {
    pagingDataEntity.current = current;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    pagingDataEntity.size = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    pagingDataEntity.total = total;
  }
  final int? maxLimit = jsonConvert.convert<int>(json['maxLimit']);
  if (maxLimit != null) {
    pagingDataEntity.maxLimit = maxLimit;
  }
  final List<OrderItemEntity>? orders = (json['orders'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<OrderItemEntity>(e) as OrderItemEntity)
      .toList();
  if (orders != null) {
    pagingDataEntity.orders = orders;
  }
  final List<T>? records = jsonConvert.convertListNotNull<T>(json['records']);
  if (records != null) {
    pagingDataEntity.records = records;
  }
  return pagingDataEntity;
}

Map<String, dynamic> $PagingDataEntityToJson(PagingDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['current'] = entity.current;
  data['size'] = entity.size;
  data['total'] = entity.total;
  data['maxLimit'] = entity.maxLimit;
  data['records'] = entity.records;
  data['orders'] = entity.orders?.map((v) => v.toJson()).toList();
  return data;
}

extension PagingDataEntityExtension on PagingDataEntity {
  PagingDataEntity copyWith({
    int? current,
    int? size,
    int? total,
    int? maxLimit,
    List<dynamic>? records,
    List<OrderItemEntity>? orders,
  }) {
    return PagingDataEntity()
      ..current = current ?? this.current
      ..size = size ?? this.size
      ..total = total ?? this.total
      ..maxLimit = maxLimit ?? this.maxLimit
      ..records = records ?? this.records
      ..orders = orders ?? this.orders;
  }
}
