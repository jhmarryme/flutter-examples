import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/responsive/responsive_helper.dart'
    as responsive;
import 'package:test_in_action/app/routes/app_pages.dart';
import 'package:test_in_action/common/constants/AppTheme.dart';
import 'package:test_in_action/config/dependency_injection.dart';
import 'package:test_in_action/config/translations/localization_service.dart';
import 'package:test_in_action/utils/MobileLikeScrollBehavior.dart';

import 'config/dio_config.dart';
import 'config/easy_loading_config.dart';
import 'services/auth/auth_service.dart';
import 'services/global_service.dart';

void main() async {
  await DependencyInjection.init();

  runApp(DevicePreview(
    // enabled: kDebugMode && kIsWeb,
    enabled: false,
    builder: (context) => const MyApp(),
  ));
  initDio();
  configEasyLoading();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const MobileLikeScrollBehavior(),
      title: "Getx Template app",
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: GlobalService.to.loadTheme,
      builder: (ctx, child) {
        ScreenUtil.init(ctx, designSize: const Size(360, 690));
        return FlutterEasyLoading(child: child);
      },
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      locale: GlobalService.to.loadLocale,
      translations: LocalizationService.getInstance(),
      binds: [Bind.put(AuthService())],
    );
  }

  @override
  void initState() {
    print('--------initState');
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    print('--------dispose');
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeMetrics() {
    if (responsive.isDesktop(context)) {
      ScreenUtil.init(context, designSize: const Size(1620, 740));
      print('--------change to Desktop');
    } else if (responsive.isTablet(context)) {
      ScreenUtil.init(context, designSize: const Size(800, 1280));
      print('--------change to Tablet');
    } else {
      ScreenUtil.init(context);
      print('--------change to Mobile');
    }
    print('--------didChangeMetrics');
    super.didChangeMetrics();
  }
}
