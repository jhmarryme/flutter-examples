import 'package:get/get.dart';
import 'package:test_in_action/app/middleware/auth_middleware.dart';
import 'package:test_in_action/app/modules/examples/refresh/refresh_binding.dart';
import 'package:test_in_action/app/modules/examples/refresh/refresh_view_new.dart';
import 'package:test_in_action/app/modules/home/home.dart';
import 'package:test_in_action/app/modules/independent/login/login_binding.dart';
import 'package:test_in_action/app/modules/independent/login/login_view.dart';
import 'package:test_in_action/app/modules/independent/not_found/not_found_binding.dart';
import 'package:test_in_action/app/modules/independent/not_found/not_found_view.dart';
import 'package:test_in_action/app/modules/independent/sign_up/sign_up_binding.dart';
import 'package:test_in_action/app/modules/independent/sign_up/sign_up_view.dart';
import 'package:test_in_action/app/modules/independent/welcome/welcome_binding.dart';
import 'package:test_in_action/app/modules/independent/welcome/welcome_view.dart';
import 'package:test_in_action/app/modules/root/root_binding.dart';
import 'package:test_in_action/app/modules/root/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: '/',
      page: () => const RootPage(),
      bindings: [RootBinding()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      middlewares: [EnsureAuthMiddleware()],
      children: [homeRoute, unknownRoute],
    ),
    loginRoute,
    signUpRoute,
    welcomeRoute,
  ];

  static final homeRoute = GetPage(
    preventDuplicates: true,
    name: _Paths.home,
    page: () => const HomeView(),
    binding: HomeBinding(),
    middlewares: [EnsureAuthMiddleware()],
    children: [
      dashboardRoute,
      profileRoute,
      productsRoute,
      settingsRoute,
    ],
  );

  static final dashboardRoute = GetPage(
    name: _Paths.dashboard,
    page: () => const DashboardView(),
    bindings: [DashboardBinding()],
  );
  static final profileRoute = GetPage(
    name: _Paths.profile,
    middlewares: [EnsureAuthMiddleware()],
    page: () => const QuizView(),
    bindings: [QuizBinding()],
  );
  static final productsRoute = GetPage(
    name: _Paths.products,
    page: () => const RefreshViewNew(),
    bindings: [RefreshBinding()],
  );
  static final settingsRoute = GetPage(
    name: _Paths.settings,
    page: () => const SettingsView(),
    binding: SettingsBinding(),
    children: [loginRoute, signUpRoute],
  );
  static final loginRoute = GetPage(
    preventDuplicates: true,
    name: _Paths.login,
    page: () => const LoginView(),
    binding: LoginBinding(),
  );
  static final signUpRoute = GetPage(
    preventDuplicates: true,
    name: _Paths.signUp,
    page: () => const SignUpView(),
    binding: SignUpBinding(),
  );
  static final welcomeRoute = GetPage(
    preventDuplicates: true,
    name: _Paths.welcome,
    page: () => const WelcomeView(),
    binding: WelcomeBinding(),
  );
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
