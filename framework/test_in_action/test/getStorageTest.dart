import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_in_action/common/foo/test_user_entity.dart';

void main() {
  test('GetStorage read/write', () {
    const key = 'test_key';
    GetStorage box = GetStorage();
    TestUserEntity entity = TestUserEntity();
    entity.id = "1";
    box.write(key, entity);
    final userInCache = box.read<TestUserEntity>(key);
    expect(userInCache?.id, 1);
  });
}
