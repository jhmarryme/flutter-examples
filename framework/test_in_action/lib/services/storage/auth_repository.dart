import 'package:get/get.dart';
import 'package:test_in_action/models/auth/token_entity.dart';
import 'package:test_in_action/utils/log_utils.dart';

import 'get_storage/default_storage_service.dart';

enum AuthStorageKey {
  token("auth_token_info"),
  ;

  final String key;

  const AuthStorageKey(this.key);
}

class AuthRepository {
  final DefaultStorageService _storageService =
      Get.find<DefaultStorageService>();

  TokenEntity? getToken() {
    var value = _storageService.read(AuthStorageKey.token.key);
    LogUtil.d("load local token: $value");

    if (value == null) {
      return null;
    }
    return value is TokenEntity ? value : TokenEntity.fromJson(value);
  }

  void logout() {
    _storageService.remove(AuthStorageKey.token.key);
  }

  void setLoginUserInfo(TokenEntity tokenEntity) {
    _storageService.write<TokenEntity>(AuthStorageKey.token.key, tokenEntity);
  }
}
