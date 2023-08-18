import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_dashboard/screens/home_screen.dart';
import 'package:responsive_dashboard/widgets/responsive/responsive_helper.dart'
    as responsive;

import 'constants.dart';

void main() {
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
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (ctx, child) {
        ScreenUtil.init(ctx, designSize: Size(360, 690));
        return Theme(
          data: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: Color(0xFF2A2D3E),
          ),
          child: HomeScreen(),
        );
      },
    );
  }

  @override
  void initState() {
    print('--------initState');
    super.initState();
    WidgetsBinding.instance.addObserver(this); //添加观察者
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
    print('--------dispose');
    WidgetsBinding.instance.removeObserver(this); //添加观察者
  }

  @override
  void didChangeMetrics() {
    if (responsive.isDesktop(context)) {
      // ScreenUtil.init(context, designSize: Size(1620, 740));
      print('--------change to Desktop');
    } else if (responsive.isTablet(context)) {
      // ScreenUtil.init(context, designSize: Size(800, 1280));
      print('--------change to Tablet');
    } else {
      // ScreenUtil.init(context);
      print('--------change to Mobile');
    }
    // print('--------didChangeMetrics');
    super.didChangeMetrics();
  }
}
