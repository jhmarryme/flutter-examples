import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_in_action/common/foo/test_user_entity.dart';
import 'package:test_in_action/common/http/model/api_page_response_entity.dart';

void main() {
  test("测试FlutterJsonBeanFactory-分页完整响应", () {
    String pagingData = """
    {
        "code":200,
        "msg":"success",
        "data":{
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
    }
    """;
    ApiPageResponseEntity<TestUserEntity> response =
        ApiPageResponseEntity.fromJson(jsonDecode(pagingData));
    expect(response.data?.records?.length == 2, true);
  });

  test("测试FlutterJsonBeanFactory-分页完整响应-records is null", () {
    String pagingData = """
    {
        "code":200,
        "msg":"success",
        "data":{
            "current":1,
            "size":1,
            "total":0,
            "maxLimit":1,
            "records":[],
            "orders":[
                {
                    "column":"username",
                    "asc":true
                }
            ]
        }
    }
    """;
    ApiPageResponseEntity<TestUserEntity> response =
        ApiPageResponseEntity.fromJson(jsonDecode(pagingData));
    expect(response.data?.records?.length == 0, true);
  });
}
