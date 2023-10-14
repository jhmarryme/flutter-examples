import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabs(),
    );
  }
}

class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> _tabs = ["Tab 1"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  void _addTab() {
    setState(() {
      final newTabIndex = _tabs.length + 1;
      _tabs.add("Tab $newTabIndex");
      _tabController = TabController(length: _tabs.length, vsync: this);
    });
  }

  void _removeTab(int index) {
    setState(() {
      _tabs.removeAt(index);
      _tabController = TabController(length: _tabs.length, vsync: this);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Tabs Example"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addTab,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _tabs
              .asMap()
              .entries
              .map(
                (entry) => Tab(
                  child: Row(
                    children: [
                      Text(entry.value),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => _removeTab(entry.key),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs
            .map(
              (tabText) => TabContent(
                tabText: tabText,
              ),
            )
            .toList(),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final String tabText;

  TabContent({required this.tabText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        tabText,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
