import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:test_in_action/app/components/business/middle_pages/success_page.dart';
import 'package:test_in_action/app/components/business/placeholder_or_not_widget.dart';
import 'package:test_in_action/app/modules/home/dashboard/dashboard_view.dart';
import 'package:test_in_action/app/modules/home/home/dashboard_view.dart';
import 'package:test_in_action/app/modules/profile/profile.dart';
import 'package:test_in_action/app/modules/root/root_view.dart';
import 'package:test_in_action/app/modules/search_view.dart';
import 'package:test_in_action/app/modules/welcome/introduce/introduce.dart';
import 'package:test_in_action/app/modules/welcome/otp_view/otp_verify_view.dart';
import 'package:test_in_action/app/modules/welcome/welcome.dart';
import 'package:test_in_action/app/routes/router_define.dart';
import 'package:test_in_action/services/auth_service.dart';
import 'package:test_in_action/utils/log_utils.dart';

part 'parts/go_router_navigator_key.dart';
part 'parts/go_router_observer.dart';
part 'parts/go_router_redirect.dart';

final goRouter = GoRouter(
  observers: [GDNavigatorObserver.instance],
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouterDefine.root.path,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: RouterDefine.root.name,
      path: RouterDefine.root.path,
      redirect: rootRedirect,
    ),
    GoRoute(
      name: RouterDefine.welcome.name,
      path: RouterDefine.welcome.path,
      builder: (context, state) => const IntroduceView(),
      routes: [
        GoRoute(
          name: WelcomeRouterDefine.login.name,
          path: WelcomeRouterDefine.login.path,
          builder: (context, state) => LoginView(
            redirectLocation: state.uri.queryParameters['redirect-location'],
            // redirectLocation: state.pathParameters['redirect-location'],
          ),
        ),
        GoRoute(
          name: WelcomeRouterDefine.index.name,
          path: WelcomeRouterDefine.index.path,
          builder: (context, state) => const WelcomeView(),
        ),
        GoRoute(
          name: WelcomeRouterDefine.otp.name,
          path: WelcomeRouterDefine.otp.path,
          builder: (context, state) => OtpVerifyView(
              username: state
                  .uri.queryParameters[WelcomeRouterDefine.otpParamUsername]!),
        ),
        GoRoute(
          name: WelcomeRouterDefine.success.name,
          path: WelcomeRouterDefine.success.path,
          builder: (context, state) => SuccessPage(
              text: state
                  .uri.queryParameters[WelcomeRouterDefine.successParamText]!),
        ),
      ],
    ),
    // GoRoute(path: _Paths.welcome),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return RootView(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeSectionNavigatorKey,
          routes: [
            GoRoute(
                name: RouterDefine.home.name,
                path: RouterDefine.home.path,
                builder: (context, state) {
                  return const HomeView();
                },
                routes: [
                  GoRoute(
                    name: HomeRouterDefine.dashboard.name,
                    path: HomeRouterDefine.dashboard.path,
                    builder: (context, state) => const DashboardView(),
                  ),
                ]),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouterDefine.search.name,
              path: RouterDefine.search.path,
              builder: (context, state) => const SearchView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            ShellRoute(
              navigatorKey: _profileSectionNavigatorKey,
              builder: (context, state, child) => ProfileView(child: child),
              routes: [
                GoRoute(
                  redirect: authRedirect,
                  name: RouterDefine.profile.name,
                  path: RouterDefine.profile.path,
                  builder: (context, state) =>
                      PlaceholderOrNotWidget(widget: SettingsView()),
                  routes: [
                    GoRoute(
                      name: ProfileRouterDefine.blank.name,
                      path: ProfileRouterDefine.blank.path,
                      builder: (context, state) => const BlankView(),
                    ),
                    GoRoute(
                      name: ProfileRouterDefine.nestedScrollView.name,
                      path: ProfileRouterDefine.nestedScrollView.path,
                      builder: (context, state) => const NestedScrollViewView(),
                    ),
                    GoRoute(
                      name: ProfileRouterDefine.formBuilder.name,
                      path: ProfileRouterDefine.formBuilder.path,
                      builder: (context, state) => const FormBuilderView(),
                    ),
                    GoRoute(
                      name: ProfileRouterDefine.refresh.name,
                      path: ProfileRouterDefine.refresh.path,
                      builder: (context, state) => const FooRefreshView(),
                    ),
                    GoRoute(
                      name: ProfileRouterDefine.chart.name,
                      path: ProfileRouterDefine.chart.path,
                      builder: (context, state) => const FooChartView(),
                    ),
                    GoRoute(
                      name: ProfileRouterDefine.dataGridPaging.name,
                      path: ProfileRouterDefine.dataGridPaging.path,
                      builder: (context, state) =>
                          const FooDataGridPagingView(),
                    ),
                    GoRoute(
                      redirect: authRedirect,
                      name: ProfileRouterDefine.profileNew.name,
                      path: ProfileRouterDefine.profileNew.path,
                      builder: (context, state) => const ProfileIndexView(),
                    ),
                    GoRoute(
                      redirect: authRedirect,
                      name: ProfileRouterDefine.profileSetting.name,
                      path: ProfileRouterDefine.profileSetting.path,
                      builder: (context, state) => const ProfileSettingView(),
                    ),
                    GoRoute(
                      redirect: authRedirect,
                      name: ProfileRouterDefine.profileSettingEmail.name,
                      path: ProfileRouterDefine.profileSettingEmail.path,
                      builder: (context, state) => const MyEmailView(),
                    ),
                  ],
                ),
              ],
            )
          ],
        )
      ],
    )
  ],
);
