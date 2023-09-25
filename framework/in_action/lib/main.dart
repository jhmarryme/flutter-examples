import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:in_action/app/components/responsive/responsive_helper.dart'
    as responsive;
import 'package:in_action/app/routes/app_pages.dart';
import 'package:in_action/app/services/auth_service.dart';
import 'package:in_action/config/translations/localization_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(
    enabled: kDebugMode && kIsWeb,
    // enabled: false,
    builder: (context) => const MyApp(),
  ));
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
      title: "Getx Template app",
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      builder: (ctx, child) {
        ScreenUtil.init(ctx, designSize: Size(360, 690));
        return Theme(
          data: ThemeData.dark().copyWith(
              // scaffoldBackgroundColor: Color(0xFF212332),
              // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(ctx).textTheme)
              //     .apply(bodyColor: Colors.white),
              // canvasColor: Color(0xFF2A2D3E),
              ),
          child: child!,
        );
      },
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: LocalizationService.defaultLanguage,
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
      ScreenUtil.init(context, designSize: Size(1620, 740));
      print('--------change to Desktop');
    } else if (responsive.isTablet(context)) {
      ScreenUtil.init(context, designSize: Size(800, 1280));
      print('--------change to Tablet');
    } else {
      ScreenUtil.init(context);
      print('--------change to Mobile');
    }
    print('--------didChangeMetrics');
    super.didChangeMetrics();
  }
}
