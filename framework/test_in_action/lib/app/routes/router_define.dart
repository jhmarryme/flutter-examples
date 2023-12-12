class RouterInfo {
  /// 名称
  final String name;

  /// 路径
  final String path;

  /// 完整路由
  final String route;

  const RouterInfo({
    required this.name,
    required this.path,
    required this.route,
  });
}

abstract class RouterDefine {
  /// 根路由
  static RouterInfo root =
      const RouterInfo(name: 'root', path: '/', route: "/");
  static RouterInfo home =
      const RouterInfo(name: 'home', path: '/home', route: "/home");
  static RouterInfo search =
      const RouterInfo(name: 'search', path: '/search', route: "/search");
  static RouterInfo welcome =
      const RouterInfo(name: 'welcome', path: '/welcome', route: "/welcome");
  static RouterInfo profile =
      const RouterInfo(name: 'profile', path: '/profile', route: "/profile");
}

abstract class HomeRouterDefine {
  static const String _routePrefix = "/home/";
  static const String _namePrefix = "home-";

  static RouterInfo dashboard = const RouterInfo(
    name: "${_namePrefix}dashboard",
    path: 'dashboard',
    route: "${_routePrefix}dashboard",
  );
}

abstract class WelcomeRouterDefine {
  static const String _routePrefix = "/welcome/";
  static const String _namePrefix = "welcome-";

  static const String otpParamUsername = "username";
  static const String successParamText = "text";

  static RouterInfo login = const RouterInfo(
    name: "${_namePrefix}login",
    path: 'login',
    route: "${_routePrefix}login",
  );
  static RouterInfo signUp = const RouterInfo(
    name: "${_namePrefix}signUp",
    path: 'signUp',
    route: "${_routePrefix}signUp",
  );
  static RouterInfo index = const RouterInfo(
    name: "${_namePrefix}index",
    path: 'index',
    route: "${_routePrefix}index",
  );
  static RouterInfo otp = const RouterInfo(
    name: "${_namePrefix}otp",
    path: 'otp',
    route: "${_routePrefix}otp",
  );
  static RouterInfo success = const RouterInfo(
    name: "${_namePrefix}success",
    path: 'success',
    route: "${_routePrefix}success",
  );
}

abstract class ProfileRouterDefine {
  static const String _routePrefix = "/profile/";
  static const String _namePrefix = "profile-";
  static RouterInfo blank = const RouterInfo(
    name: "${_namePrefix}blank",
    path: 'blank',
    route: "${_routePrefix}blank",
  );
  static RouterInfo nestedScrollView = const RouterInfo(
    name: "${_namePrefix}nested-scroll-view",
    path: 'nested-scroll-view',
    route: "${_routePrefix}nested-scroll-view",
  );
  static RouterInfo formBuilder = const RouterInfo(
    name: "${_namePrefix}formBuilder",
    path: 'formBuilder',
    route: "${_routePrefix}formBuilder",
  );

  static RouterInfo refresh = const RouterInfo(
    name: "${_namePrefix}refresh",
    path: 'refresh',
    route: "${_routePrefix}refresh",
  );
  static RouterInfo chart = const RouterInfo(
    name: "${_namePrefix}chart",
    path: 'chart',
    route: "${_routePrefix}chart",
  );
  static RouterInfo dataGridPaging = const RouterInfo(
    name: "${_namePrefix}dataGridPaging",
    path: 'dataGridPaging',
    route: "${_routePrefix}dataGridPaging",
  );
  static RouterInfo profileNew = const RouterInfo(
    name: "${_namePrefix}profileNew",
    path: 'profileNew',
    route: "${_routePrefix}profileNew",
  );

  static RouterInfo profileSetting = const RouterInfo(
    name: "${_namePrefix}profileSetting",
    path: 'profileSetting',
    route: "${_routePrefix}profileSetting",
  );
  static RouterInfo profileSettingEmail = const RouterInfo(
    name: "${_namePrefix}profileSettingEmail",
    path: 'profileSettingEmail',
    route: "${_routePrefix}profileSettingEmail",
  );
  static RouterInfo profileSettingPhone = const RouterInfo(
    name: "${_namePrefix}profileSettingPhone",
    path: 'profileSettingPhone',
    route: "${_routePrefix}profileSettingPhone",
  );
}

abstract class SearchRouteDefine {
  static const String _routePrefix = "/search/";
  static const String _namePrefix = "search-";
  static RouterInfo blank = const RouterInfo(
    name: "${_namePrefix}blank",
    path: 'blank',
    route: "${_routePrefix}blank",
  );
}
