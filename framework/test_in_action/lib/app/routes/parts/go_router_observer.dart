part of '../go_router_configuration.dart';

/// 构造一个全局路由观察者
class GDNavigatorObserver extends NavigatorObserver {
  static GDNavigatorObserver instance = GDNavigatorObserver();

  static BuildContext? getContext() {
    return instance.navigator?.context;
  }
}

/// 监听路由生命周期变化
class MyNavObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) => LogUtil.d(
      'didPush: ${route.toString()}, previousRoute= ${previousRoute?.toString()}');

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) => LogUtil.d(
      'didPop: ${route.toString()}, previousRoute= ${previousRoute?.toString()}');

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) => LogUtil.d(
      'didRemove: ${route.toString()}, previousRoute= ${previousRoute?.toString()}');

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      LogUtil.d(
          'didReplace: new= ${newRoute?.toString()}, old= ${oldRoute?.toString()}');

  @override
  void didStartUserGesture(
          Route<dynamic> route, Route<dynamic>? previousRoute) =>
      LogUtil.d(
          'didStartUserGesture: ${route.toString()}, previousRoute= ${previousRoute?.toString()}');

  @override
  void didStopUserGesture() => LogUtil.d('didStopUserGesture');
}
