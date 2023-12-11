import 'dart:convert';

import 'package:test_in_action/common/http/model/order_item_entity.dart';
import 'package:test_in_action/common/http/model/paging_data_entity.g.dart';

export 'package:test_in_action/common/http/model/paging_data_entity.g.dart';

class PagingDataEntity<T> {
  // 当前页
  int? current;

  // 每页显示条数
  int? size;

  // 查询列表总记录数
  int? total;

  // 单页分页条数限制
  int? maxLimit;

  // 排序字段信息，允许前端传入的时候，注意 SQL 注入问题，可以使用 SqlInjectionUtils.check(...) 检查文本
  List<OrderItemEntity>? orders;

  // 查询数据列表
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
