import 'package:get/get.dart';
import 'package:in_action/app/middleware/auth_middleware.dart';
import 'package:in_action/app/modules/dashboard/dashboard_binding.dart';
import 'package:in_action/app/modules/dashboard/dashboard_view.dart';
import 'package:in_action/app/modules/examples/refresh/refresh_binding.dart';
import 'package:in_action/app/modules/examples/refresh/refresh_view.dart';
import 'package:in_action/app/modules/home/home_binding.dart';
import 'package:in_action/app/modules/home/views/home_view.dart';
import 'package:in_action/app/modules/login/login_binding.dart';
import 'package:in_action/app/modules/login/login_view.dart';
import 'package:in_action/app/modules/not_found/not_found_binding.dart';
import 'package:in_action/app/modules/not_found/not_found_view.dart';
import 'package:in_action/app/modules/profile/profile_binding.dart';
import 'package:in_action/app/modules/profile/profile_view.dart';
import 'package:in_action/app/modules/root/root_binding.dart';
import 'package:in_action/app/modules/root/root_view.dart';
import 'package:in_action/app/modules/sign_up/sign_up_binding.dart';
import 'package:in_action/app/modules/sign_up/sign_up_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.home;

  static final routes = [
    GetPage(
        name: '/',
        page: () => const RootPage(),
        bindings: [RootBinding()],
        participatesInRootNavigator: true,
        preventDuplicates: true,
        children: [
          loginRoute,
          signUpRoute,
          homeRoute,
          unknownRoute,
        ]),
  ];

  static final loginRoute = GetPage(
    preventDuplicates: true,
    name: _Paths.login,
    page: () => const LoginPage(),
    binding: LoginBinding(),
  );

  static final signUpRoute = GetPage(
    preventDuplicates: true,
    name: _Paths.signUp,
    page: () => const SignUpPage(),
    binding: SignUpBinding(),
  );

  static final homeRoute = GetPage(
      preventDuplicates: true,
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.dashboard,
          page: () => const DashboardView(),
          bindings: [DashboardBinding()],
        ),
        GetPage(
          name: _Paths.profile,
          middlewares: [EnsureAuthMiddleware()],
          page: () => ProfileView(),
          bindings: [ProfileBinding()],
        ),
        GetPage(
          name: _Paths.products,
          page: () => const RefreshView(),
          bindings: [RefreshBinding()],
        ),
      ]);

  static final unknownRoute = GetPage(
    name: _Paths.notFound,
    page: () => const NotFoundPage(),
    binding: NotFoundBinding(),
  );

// static final proxyRoute = GetPage(
//   name: Routes.PROXY,
//   page: () => ProxyPage(),
// );
}
