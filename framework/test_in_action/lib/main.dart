import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/responsive/responsive_helper.dart';
import 'package:test_in_action/app/routes/go_router_configuration.dart';
import 'package:test_in_action/common/builder/app_theme_builder.dart';
import 'package:test_in_action/config/initializer.dart';
import 'package:test_in_action/config/translations/localization_service.dart';
import 'package:test_in_action/utils/mobile_like_scroll_behavior.dart';

import 'services/global_service.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await beforeRunApp();
  runApp(
    DevicePreview(
      enabled: kDebugMode && kIsWeb,
      // enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
  afterRunApp();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final designSize = getValueForScreenType(
      context: context,
      mobile: const Size(1620, 740),
      tablet: const Size(800, 1280),
      desktop: const Size(360, 690),
    );
    return ScreenUtilInit(
      // designSize: designSize,
      ensureScreenSize: true,
      child: GetMaterialApp.router(
        title: "Flutter test in action",
        scrollBehavior: const MobileLikeScrollBehavior(),
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        theme: AppThemeBuilder.light,
        darkTheme: AppThemeBuilder.dark,
        themeMode: GlobalService.to.loadTheme,
        builder: (context, child) {
          final easyLoad = EasyLoading.init();
          child = easyLoad(context, child);
          return child;
        },
        locale: GlobalService.to.loadLocale,
        translations: LocalizationService.getInstance(),
        supportedLocales: LocalizationService.supportedLocales,
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerDelegate: goRouter.routerDelegate,
        routeInformationParser: goRouter.routeInformationParser,
        routeInformationProvider: goRouter.routeInformationProvider,
        // backButtonDispatcher: goRouter.backButtonDispatcher,
      ),
    );
  }

  @override
  void initState() {
    // print('--------initState');
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    // print('--------dispose');
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeMetrics() {
    // if (responsive.isDesktop(context)) {
    //   ScreenUtil.init(context, designSize: const Size(1620, 740));
    //   // print('--------change to Desktop');
    // } else if (responsive.isTablet(context)) {
    //   ScreenUtil.init(context, designSize: const Size(800, 1280));
    //   // print('--------change to Tablet');
    // } else {
    //   ScreenUtil.init(context);
    //   // print('--------change to Mobile');
    // }
    // print('--------didChangeMetrics');
    super.didChangeMetrics();
  }
}
