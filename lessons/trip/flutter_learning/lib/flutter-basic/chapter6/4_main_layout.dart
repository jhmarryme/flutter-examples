import 'package:flutter/material.dart';

import '1_stateless_widget.dart';
import '2_stateful_widget.dart';
import '3_layout.dart';
import '5_gesture.dart';
import '6_resource.dart';
import '7_lanuch.dart';

void main() => runApp(RouteNavigatorLearning());

class RouteNavigatorLearning extends StatefulWidget {
  const RouteNavigatorLearning({Key? key}) : super(key: key);

  @override
  State<RouteNavigatorLearning> createState() => _RouteNavigatorLearningState();
}

class _RouteNavigatorLearningState extends State<RouteNavigatorLearning> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('如何创建和使用Flutter的路由与导航？'),
          ),
          body: RouteNavigator()),
      routes: {
        'less': (context) => StatelessWidgetLearning(),
        'ful': (context) => StatefulWidgetLearning(),
        'layout': (context) => LayoutLearning(),
        'gesture': (context) => GestureLearning(),
        'res': (BuildContext context) => ResourceLearning(),
        'launch': (BuildContext context) => LaunchLearning(),
        // 'widgetLifecycle': (BuildContext context) => WidgetLifecycle(),
        // 'appLifecycle': (BuildContext context) => AppLifecycle(),
        // 'photo': (BuildContext context) => PhotoApp(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  const RouteNavigator({Key? key}) : super(key: key);

  @override
  State<RouteNavigator> createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SwitchListTile(
            title: Text('${byName ? '' : '不'}通过路由名跳转'),
            value: byName,
            onChanged: (value) {
              setState(() {
                byName = value;
              });
            },
          ),
          _item('StatelessWidget与基础组件', StatelessWidgetLearning(), 'less'),
          _item('StatefulWidget与基组件', StatefulWidgetLearning(), 'ful'),
          _item('如何进行Flutter布局开发', LayoutLearning(), 'layout'),
          _item('如何检测用户手势以及处理点击事件？', GestureLearning(), 'gesture'),
          _item('如何导入和使用Flutter的资源文件？', ResourceLearning(), 'res'),
          _item('如何打开第三方应用？', LaunchLearning(), 'launch'),
          // _item('Flutter页面生命周期', WidgetLifecycle(), 'widgetLifecycle'),
          // _item('Flutter应用生命周期', AppLifecycle(), 'appLifecycle'),
          // _item('【实战尝鲜】拍照APP开发', PhotoApp(), 'photo'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            if (byName) {
              Navigator.pushNamed(context, routeName);
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => page,
                  ));
            }
          },
          child: Text(title)),
    );
  }
}
