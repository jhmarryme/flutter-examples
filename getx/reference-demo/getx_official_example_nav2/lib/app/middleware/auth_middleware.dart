import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/parse_route.dart';
import 'package:getx_official_example_nav2/services/auth_service.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
    // you can do whatever you want here
    // but it's preferable to make this method fast
    // await Future.delayed(Duration(milliseconds: 500));

    if (!AuthService.to.isLoggedInValue) {
      final newRoute = Routes.LOGIN_THEN(route.pageSettings!.name);
      return RouteDecoder.fromRoute(newRoute);
    }
    return await super.redirectDelegate(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  @override
  Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
    if (AuthService.to.isLoggedInValue) {
      //NEVER navigate to auth screen, when user is already authed
      return null;

      //OR redirect user to another screen
      //return RouteDecoder.fromRoute(Routes.PROFILE);
    }
    return await super.redirectDelegate(route);
  }
}
