import 'package:test_in_action/app/components/business/otp/otp_logic.dart';
import 'package:test_in_action/common/http/dio_utils.dart';
import 'package:test_in_action/common/http/request_helper.dart';

class OtpVerifyLogic extends OtpLogic {
  @override
  Future<bool> doVerify(String code) async {
    final Map<String, dynamic> params = <String, dynamic>{};
    params['code'] = code;
    String token = await RequestHelper.requestNetwork<String>(
      url:
          "https://console-mock.apipost.cn/mock/e090c5f3-73d8-4738-b3d8-6beef69b00dc/v1/verify",
      Method.post,
      // queryParameters: params,
      params: params,
    );
    super.token.value = token;
    return token.isNotEmpty;
  }
}
