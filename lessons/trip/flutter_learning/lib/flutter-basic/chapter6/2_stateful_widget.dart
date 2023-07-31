import 'package:flutter/material.dart';

// StatefulWidget与基础组件 学习

class StatefulWidgetLearning extends StatefulWidget {
  const StatefulWidgetLearning({Key? key}) : super(key: key);

  @override
  State<StatefulWidgetLearning> createState() => _StatefulWidgetLearningState();
}

class _StatefulWidgetLearningState extends State<StatefulWidgetLearning> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('StatelessWidget与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        // 底部导航键
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  label: '首页',
                  icon: Icon(Icons.home, color: Colors.grey),
                  activeIcon: Icon(Icons.home, color: Colors.blue)),
              BottomNavigationBarItem(
                  label: "列表",
                  icon: Icon(Icons.list, color: Colors.grey),
                  activeIcon: Icon(Icons.list, color: Colors.blue)),
            ]),
        // 悬浮按钮
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Text('click me'),
        ),
        body: choiceOne(_currentIndex),
      ),
    );
  }

  Future<Null> _onRefreshIndicatorMethod() async {
    print('_onRefreshIndicatorMethod');
    await Future.delayed(const Duration(milliseconds: 200));
    return null;
  }

  choiceOne(int index) {
    print('choiceOne: $index');
    if (index == 0) {
      return RefreshIndicator(
        onRefresh: _onRefreshIndicatorMethod,
        child: ListView(
          children: [
            Image.network(
              'http://www.devio.org/img/avatar.png',
              width: 100,
              height: 100,
            ),
            // 输入框
            const TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                hintText: 'Please input',
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              height: 100,
              margin: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(color: Colors.lightBlueAccent),
              // PageView 横向滑动
              child: PageView(
                children: <Widget>[
                  _item('page1', Colors.deepPurple),
                  _item('page2', Colors.green),
                  _item('page3', Colors.red),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return const Text('List');
    }
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
