import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  final List<Widget> _tabViews = [
    TabContent(1),
    TabContent(2),
    TabContent(3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _currentIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _currentIndex = index;
                _pageController.animateToPage(
                  _currentIndex,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.star),
                label: Text('Tab 1'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star),
                label: Text('Tab 2'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star),
                label: Text('Tab 3'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: _tabViews,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final int tab;

  TabContent(this.tab);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tab $tab Content'),
    );
  }
}
