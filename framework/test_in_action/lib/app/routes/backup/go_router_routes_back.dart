// part of 'go_router_configuration.dart';

abstract class Routes {
  /// profile
  static const profile = _ProfilePaths.profile;
  static const foo = _ProfilePaths.foo;

  static const blank = "${_ProfilePaths.profile}/${_ProfilePaths.blank}";
  static const nestedScrollView =
      "${_ProfilePaths.profile}/${_ProfilePaths.nestedScrollView}";
  static const formBuilder =
      "${_ProfilePaths.profile}/${_ProfilePaths.formBuilder}";
  static const refresh = "${_ProfilePaths.foo}/${_ProfilePaths.refresh}";

  // independent
  static const login = _Paths.login;
  static const signUp = _Paths.signUp;
  static const welcome = _Paths.welcome;
}

abstract class _Paths {
  static const welcome = '/welcome';
  static const login = 'login';
  static const signUp = '/sign-up';
}

abstract class _ProfilePaths {
  /// root path
  static const profile = "/profile-main";
  static const foo = '/profile-foo';

  /// sub path
  static const blank = 'blank';
  static const nestedScrollView = 'nested-scroll-view';
  static const formBuilder = 'builder';
  static const refresh = 'refresh';
}
