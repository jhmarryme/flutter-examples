import 'package:flutter/material.dart';

import '1_tabbed_appbar_learning.dart';
import '2_sidebar_menu_learning.dart';

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
            title: Text('课程代码练习'),
          ),
          body: RouteNavigator()),
      routes: {
        'tabbedAppBar': (context) => TabbedAppBarLearning(),
        'sideBar': (context) => SidebarMenuLearning(),
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
    return Column(
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
        _item('TabbedAppBarSample', TabbedAppBarLearning(), 'tabbedAppBar'),
        _item('SidebarMenuLearning', SidebarMenuLearning(), 'sideBar'),
      ],
    );
  }

  _item(String title, page, String routeName) {
    return ElevatedButton(
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
        child: Text(title));
  }
}
