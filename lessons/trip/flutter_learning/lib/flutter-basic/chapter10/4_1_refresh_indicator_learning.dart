import 'package:flutter/material.dart';

void main() => runApp(RefreshIndicatorLearning());
List<String> cityNames = [
  '北京',
  '上海',
  '广州',
  '深圳',
  '杭州',
  '苏州',
  '成都',
  '武汉',
  '郑州',
  '洛阳',
  '厦门',
  '青岛',
  '拉萨'
];

class RefreshIndicatorLearning extends StatefulWidget {
  const RefreshIndicatorLearning({super.key});

  @override
  _RefreshIndicatorLearningState createState() =>
      _RefreshIndicatorLearningState();
}

class _RefreshIndicatorLearningState extends State<RefreshIndicatorLearning> {
  @override
  Widget build(BuildContext context) {
    final title = '高级功能列表下拉刷新与上拉加载更多功能实现';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView(
          children: _buildList(),
        ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityNames = cityNames.reversed.toList();
    });
    return null;
  }

  List<Widget> _buildList() {
    return cityNames.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
