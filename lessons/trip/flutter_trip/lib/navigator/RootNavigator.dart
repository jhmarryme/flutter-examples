import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';

import '../pages/MyPage.dart';
import '../pages/SearchPage.dart';
import '../pages/travel_page.dart';

/// 简单的首页框架, 通过PageView结合BottomNavigationBar实现
class RootNavigator extends StatefulWidget {
  const RootNavigator({Key? key}) : super(key: key);

  @override
  State<RootNavigator> createState() => _RootNavigatorState();
}

class _RootNavigatorState extends State<RootNavigator> {
  // 未选中的标签颜色
  final _defaultColor = Colors.grey;

  // 选中的标签颜色
  final _activeColor = Colors.blue;

  // 控制PageView的切换
  final _pageController = PageController();

  // 控制bottomNavigationBar
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // 控制器, 通过这个controller可以控制页面的切换
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          // 页面滑动切换时, 同步切换底部导航栏
          setState(() {
            _currentIndex = index;
          });
        },
        // 定义顺序, 0/1/2/3即onPageChanged#index的变量值
        children: const [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // 选中的标签颜色
        unselectedItemColor: _defaultColor,
        // 未选中的标签颜色
        selectedItemColor: _activeColor,
        // 标签的文本样式
        selectedLabelStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        onTap: (index) {
          // 与PageView的联动, 因为index与PageView对应, 通过index可以控制页面的切换
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        // 这里的顺序需要与ageView中定义的children顺序一致
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: '旅拍'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: '我的'),
        ],
      ),
    );
  }
}
