import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_in_action/app/json/base/json_convert_content.dart';
import 'package:test_in_action/common/foo/test_user_entity.dart';

void main() {
  test('测试FlutterJsonBeanFactory-单实体解析', () {
    String userData = """
     {
        "id":"12313",
        "name":"loongwind",
        "age":18
     }
    """;

    // fromJson 需要的参数是 Map ，所以需要先使用 jsonDecode 将 Json 字符串转换为 Map
    TestUserEntity user1 = TestUserEntity.fromJson(jsonDecode(userData));
    // convert / fromJsonAsT 方法可以实现相同的解析效果
    TestUserEntity? user2 =
        jsonConvert.convert<TestUserEntity>(jsonDecode(userData));
    TestUserEntity? user3 =
        JsonConvert.fromJsonAsT<TestUserEntity>(jsonDecode(userData));
    expect(user1.id == "12313", true);
    expect(user2?.id == "12313", true);
    expect(user3?.id == "12313", true);
  });

  test("测试FlutterJsonBeanFactory-List 解析", () {
    String userData = """
     [
        {
          "id":"12313",
          "name":"loongwind",
          "age":18
        },
        {
          "id":"22222",
          "name":"cmad",
          "age":25
        }
     ]
    """;
    List<TestUserEntity>? users1 =
        JsonConvert.fromJsonAsT<List<TestUserEntity>>(jsonDecode(userData));

    List<TestUserEntity?>? users2 =
        jsonConvert.convertList<TestUserEntity>(jsonDecode(userData));

    List<TestUserEntity>? users3 =
        jsonConvert.convertListNotNull<TestUserEntity>(jsonDecode(userData));
    expect(users1?.length == 2, true);
    expect(users2?.length == 2, true);
    expect(users3?.length == 2, true);
  });
}
