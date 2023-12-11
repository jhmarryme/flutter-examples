// import 'package:get/get.dart';
// import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/nested_scroll_view/nested_scroll_view_view.dart';
// import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/nested_scroll_view/nested_scroll_view_page_binding.dart';
// import 'package:test_in_action/app/middleware/auth_middleware.dart';
// import 'package:test_in_action/app/modules/examples/chart/chart_binding.dart';
// import 'package:test_in_action/app/modules/examples/chart/chart_view.dart';
// import 'package:test_in_action/app/modules/examples/data_grid/data_grid_paging/data_grid_paging_binding.dart';
// import 'package:test_in_action/app/modules/examples/data_grid/data_grid_paging/foo_data_grid_paging_view.dart';
// import 'package:test_in_action/app/modules/examples/form_builder/form_builder_binding.dart';
// import 'package:test_in_action/app/modules/examples/form_builder/form_builder_view.dart';
// import 'package:test_in_action/app/modules/examples/refresh/refresh_binding.dart';
// import 'package:test_in_action/app/modules/examples/refresh/foo_refresh_view.dart';
// import 'package:test_in_action/app/modules/home/home.dart';
// import 'package:test_in_action/app/modules/independent/login/login_binding.dart';
// import 'package:test_in_action/app/modules/independent/login/login_view.dart';
// import 'package:test_in_action/app/modules/independent/not_found/not_found_binding.dart';
// import 'package:test_in_action/app/modules/independent/not_found/not_found_view.dart';
// import 'package:test_in_action/app/modules/independent/sign_up/sign_up_binding.dart';
// import 'package:test_in_action/app/modules/independent/sign_up/sign_up_view.dart';
// import 'package:test_in_action/app/modules/independent/test/data_table/data_table_binding.dart';
// import 'package:test_in_action/app/modules/independent/test/data_table/data_table_view.dart';
// import 'package:test_in_action/app/modules/independent/welcome/welcome_binding.dart';
// import 'package:test_in_action/app/modules/independent/welcome/welcome_view.dart';
// import 'package:test_in_action/app/modules/root/root_binding.dart';
// import 'package:test_in_action/app/modules/root/root_view.dart';
//
// part 'app_routes.dart';
//
// class AppPages {
//   AppPages._();
//
//   static const initial = Routes.home;
//
//   static final routes = [
//     GetPage(
//       name: '/',
//       page: () => const RootView(),
//       bindings: [RootBinding()],
//       participatesInRootNavigator: true,
//       // preventDuplicates: true,
//       middlewares: [EnsureAuthMiddleware()],
//       children: [
//         homeRoute,
//         unknownRoute,
//         formBuilderRoute,
//         dataTableTestRoute,
//         dataDataGridRoute,
//       ],
//     ),
//     loginRoute,
//     signUpRoute,
//     welcomeRoute,
//     // dataTableTestRoute,
//     // dataDataGridRoute,
//     // formBuilderRoute,
//     unknownRoute,
//     chartsRoute,
//     nestedPageRoute
//   ];
//
//   static final homeRoute = GetPage(
//     // preventDuplicates: true,
//     name: _Paths.home,
//     page: () => const HomeView(),
//     binding: HomeBinding(),
//     middlewares: [EnsureAuthMiddleware()],
//     children: [
//       dashboardRoute,
//       profileRoute,
//       productsRoute,
//       settingsRoute,
//     ],
//   );
//
//   static final dashboardRoute = GetPage(
//     name: _Paths.dashboard,
//     page: () => const DashboardView(),
//     bindings: [DashboardBinding()],
//   );
//   static final profileRoute = GetPage(
//     name: _Paths.profile,
//     middlewares: [EnsureAuthMiddleware()],
//     page: () => const QuizView(),
//     bindings: [QuizBinding()],
//   );
//   static final productsRoute = GetPage(
//     name: _Paths.products,
//     page: () => const RefreshViewNew(),
//     bindings: [RefreshBinding()],
//   );
//   static final settingsRoute = GetPage(
//     name: _Paths.settings,
//     page: () => const SettingsView(),
//     binding: SettingsBinding(),
//     children: [loginRoute, signUpRoute],
//   );
//   static final loginRoute = GetPage(
//     // preventDuplicates: true,
//     name: _Paths.login,
//     page: () => const LoginView(),
//     binding: LoginBinding(),
//   );
//   static final signUpRoute = GetPage(
//     // preventDuplicates: true,
//     name: _Paths.signUp,
//     page: () => const SignUpView(),
//     binding: SignUpBinding(),
//   );
//   static final welcomeRoute = GetPage(
//     // preventDuplicates: true,
//     name: _Paths.welcome,
//     page: () => const WelcomeView(),
//     binding: WelcomeBinding(),
//   );
//   static final unknownRoute = GetPage(
//     name: _Paths.notFound,
//     page: () => const NotFoundPage(),
//     binding: NotFoundBinding(),
//   );
//
//   static final dataTableTestRoute = GetPage(
//     name: Routes.dataTable,
//     page: () => const DataTableView(),
//     binding: DataTableBinding(),
//   );
//
//   static final dataDataGridRoute = GetPage(
//     name: Routes.dataGrid,
//     page: () => const DataGridPagingView(),
//     binding: DataGridPagingBinding(),
//   );
//   static final formBuilderRoute = GetPage(
//     name: Routes.formBuilder,
//     page: () => const FormBuilderView(),
//     binding: FormBuilderBinding(),
//   );
//   static final chartsRoute = GetPage(
//     name: Routes.charts,
//     page: () => const ChartView(),
//     binding: ChartBinding(),
//   );
//   static final nestedPageRoute = GetPage(
//     name: Routes.nestPage,
//     page: () => const NestedScrollViewPage(),
//     binding: NestedScrollViewPageBinding(),
//   );
// // static final proxyRoute = GetPage(
// //   name: Routes.PROXY,
// //   page: () => ProxyPage(),
// // );
// }
