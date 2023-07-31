import 'package:flutter/material.dart';

import '1_1_listView_horizontal_learning.dart';
import '1_2_listview_vertical_learning.dart';
import '2_expansion_tile_learning.dart';
import '3_grid_view_learning.dart';
import '4_1_refresh_indicator_learning.dart';
import '4_2_scroll_controller_learning.dart';

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
        'ListViewHorizontal': (context) => const ListViewHorizontalLearning(),
        'listViewVertical': (context) => const ListViewVerticalLearning(),
        'expansionTile': (context) => const ExpansionTileLearning(),
        'gridView': (context) => const GridViewLearning(),
        'scrollController': (context) => const ScrollControllerLearning(),
        'refreshIndicator': (context) => const RefreshIndicatorLearning(),
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
        _item('ListViewHorizontal', const ListViewHorizontalLearning(),
            'ListViewHorizontal'),
        _item('ListViewVertical', const ListViewVerticalLearning(),
            'listViewVertical'),
        _item('ExpansionTile', const ExpansionTileLearning(), 'expansionTile'),
        _item('GridViewLearning', const GridViewLearning(), 'gridView'),
        _item('RefreshIndicator', const RefreshIndicatorLearning(),
            'refreshIndicator'),
        _item('ScrollController', const ScrollControllerLearning(),
            'scrollController'),
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
