import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:responsive_dashboard/screens/side_menu/side_menu.dart';
import 'package:responsive_dashboard/widgets/responsive/responsive_helper.dart'
    as responsive;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void printScreenInformation() {
    print('设备宽度:${1.sw}dp');
    print('设备高度:${1.sh}dp');
    print('设备的像素密度:${ScreenUtil().pixelRatio}');
    print('底部安全区距离:${ScreenUtil().bottomBarHeight}dp');
    print('状态栏高度:${ScreenUtil().statusBarHeight}dp');
    print('实际宽度和字体(dp)与设计稿(dp)的比例:${ScreenUtil().scaleWidth}');
    print('实际高度(dp)与设计稿(dp)的比例:${ScreenUtil().scaleHeight}');
    print('高度相对于设计稿放大的比例:${ScreenUtil().scaleHeight}');
    print('系统的字体缩放比例:${ScreenUtil().textScaleFactor}');
    print('屏幕宽度的0.5:${0.5.sw}dp');
    print('屏幕高度的0.5:${0.5.sh}dp');
    print('屏幕方向:${ScreenUtil().orientation}');
  }

  @override
  Widget build(BuildContext context) {
    printScreenInformation();
    return Scaffold(
      // drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (responsive.isDesktop(context))
              const Expanded(child: SideMenu()),
            const Expanded(flex: 5, child: DashboardScreen())
          ],
        ),
      ),
    );
  }
}
