import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/responsive/responsive_helper.dart';

/// mobile: 只展示dynamicContent
/// desktop/tablet: 展示一个具有左右两部分区域的页面，用于嵌套路由使用
/// 左边区域：固定显示内容
/// 右边区域：路由占位显示区域
class PlaceholderRootView extends StatelessWidget {
  const PlaceholderRootView(
      {Key? key, required this.fixedContent, required this.dynamicContent})
      : super(key: key);

  final Widget fixedContent;
  final Widget dynamicContent;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgetBuilder(
      mobile: dynamicContent,
      tablet: buildDesktop(context),
      desktop: buildDesktop(context),
    );
  }

  Widget buildDesktop(context) {
    return Row(
      children: [
        Expanded(flex: 1, child: fixedContent),
        const VerticalDivider(thickness: 1, width: 10),
        Expanded(flex: 1, child: dynamicContent),
      ],
    );
  }
}
