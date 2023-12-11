part of '../go_router_configuration.dart';

/// 将未登录的用户重定向到 [登录页], 并且登录后返回原地址
FutureOr<String?> authRedirect(
    BuildContext context, GoRouterState state) async {
  if (AuthService.to.isLogin) {
    return null;
  }
  // return "/login";
  return state.namedLocation(WelcomeRouterDefine.login.name, queryParameters: {
    "redirect-location": state.fullPath ?? state.matchedLocation,
    // "text": '未登录无法跳转到对应页面'
  });
}

/// 将登录的用户重定向到 [个人页]
/// 将未登录的用户重定向到 [欢迎页]
FutureOr<String?> rootRedirect(
    BuildContext context, GoRouterState state) async {
  if (AuthService.to.isLogin) {
    return state.namedLocation(RouterDefine.profile.name);
  }
  return state.namedLocation(RouterDefine.welcome.name);
}
