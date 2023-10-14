import 'package:in_action/models/auth/token_entity.dart';

import 'get_storage/storage_service.dart';

class AuthRepository {
  final StorageService _storageService = StorageService();
  String tokenKey = "";

  TokenEntity? getToken() {
    return _storageService.read<TokenEntity>(tokenKey);
  }

  void logout() {
    _storageService.remove(tokenKey);
  }

  void setLoginUserInfo(TokenEntity tokenEntity) {
    _storageService.write(tokenKey, tokenEntity);
  }
}
