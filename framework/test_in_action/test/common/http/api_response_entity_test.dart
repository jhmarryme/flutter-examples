import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/quiz_entity.dart';
import 'package:test_in_action/common/foo/test_user_entity.dart';
import 'package:test_in_action/common/http/model/api_response_entity.dart';

void main() {
  test("测试FlutterJsonBeanFactory-泛型单个对象解析", () {
    String userData = """
    {
      "code": 200,
      "msg": "success",
      "data":{
        "id": "12312312",
        "name": "wwwwwwwwwwwwjh",
        "age": 18
      }
    }
    """;
    ApiResponseEntity<TestUserEntity> response =
        ApiResponseEntity.fromJson(jsonDecode(userData));
    print(response.data?.name);
  });
  test("测试FlutterJsonBeanFactory-泛型List对象解析", () {
    String userData = """
    {
      "code": 200,
      "msg": "success",
      "data":[
        {
          "id": "12312312",
          "name": "www2",
          "age": 18
        },{
          "id": "333333",
          "name": "www222",
          "age": 25
        }
      ]
    }
    """;
    ApiResponseEntity<List<TestUserEntity>> response =
        ApiResponseEntity.fromJson(jsonDecode(userData));
    expect(response.data?.length == 2, true);
  });

  test("测试FlutterJsonBeanFactory-泛型List对象解析2", () {
    String userData = """
    {
        "code":200,
        "msg":200,
        "data":[
            {
                "id":20,
                "rightCount":1,
                "wrongCount":0,
                "question":"想。",
                "verified":"1",
                "answer":"B",
                "options":[
                    {
                        "option":"A",
                        "value":"选项1"
                    }
                ]
            }
        ]
    }
    """;
    ApiResponseEntity<List<QuizEntity>> response =
        ApiResponseEntity.fromJson(jsonDecode(userData));
    expect(response.data?.length == 1, true);
  });
}
