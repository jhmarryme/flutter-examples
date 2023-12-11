import 'package:test_in_action/common/http/dio_utils.dart';
import 'package:test_in_action/common/http/model/paging_data_entity.dart';
import 'package:test_in_action/common/http/request_helper.dart';
import 'package:test_in_action/models/foo/foo_user_entity.dart';
import 'package:test_in_action/models/http/page_request_entity.dart';

class FooDao {
  // static Future<PagingDataEntity<FooUserEntity>?> pageUser(int page) async {
  //   final Map<String, dynamic> params = <String, dynamic>{};
  //   params["size"] = page;
  //   PagingDataEntity<FooUserEntity>? pagingDataEntity =
  //       await RequestHelper.requestPageNetwork<FooUserEntity>(
  //     Method.post,
  //     params: params,
  //     url:
  //         "https://console-mock.apipost.cn/mock/e090c5f3-73d8-4738-b3d8-6beef69b00dc/v1/order/order",
  //   );
  //   return pagingDataEntity;
  // }

  static Future<PagingDataEntity<FooUserEntity>?> pageUser(
      PageRequestEntity pageRequest) async {
    PagingDataEntity<FooUserEntity>? pagingDataEntity =
        await RequestHelper.requestPageNetwork<FooUserEntity>(
      Method.post,
      params: pageRequest.toJson(),
      url:
          "https://console-mock.apipost.cn/mock/e090c5f3-73d8-4738-b3d8-6beef69b00dc/v1/order/order",
    );
    return pagingDataEntity;
  }
}
