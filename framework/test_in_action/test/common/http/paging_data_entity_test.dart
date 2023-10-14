import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_in_action/common/foo/test_user_entity.dart';
import 'package:test_in_action/common/http/model/paging_data_entity.dart';

void main() {
  test("测试FlutterJsonBeanFactory-分页响应", () {
    String pagingData = """
    {
        "current":1,
        "size":1,
        "total":1,
        "maxLimit":1,
        "records":[
            {
                "id":"12313",
                "name":"www",
                "age":18
            },
            {
                "id":"22222",
                "name":"www2",
                "age":25
            }
        ],
        "orders":[
            {
                "column":"username",
                "asc":true
            }
        ]
    }
    """;
    PagingDataEntity<TestUserEntity> response =
        PagingDataEntity.fromJson(jsonDecode(pagingData));
    expect(response.records?.length == 2, true);
  });
}
