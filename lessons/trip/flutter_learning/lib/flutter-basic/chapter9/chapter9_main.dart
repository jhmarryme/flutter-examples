import 'package:flutter/material.dart';
import 'package:flutter_learning/flutter-basic/chapter9/2_future_learning.dart';

import '1_http_learning.dart';
import '4_share_preference_learning.dart';

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
        'http': (context) => const HttpLearning(),
        'future': (context) => const FutureLearning(),
        'shared_preferences': (context) => const SharePreferenceLearning(),
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
        _item('HttpLearning', const HttpLearning(), 'http'),
        _item('FutureLearning', const FutureLearning(), 'future'),
        _item('SharePreferenceLearning', const SharePreferenceLearning(),
            'shared_preferences'),
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
