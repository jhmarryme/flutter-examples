import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('NavigationRail with ExpansionTile'),
        ),
        body: CustomNavigationRail(),
      ),
    );
  }
}

class CustomNavigationRail extends StatefulWidget {
  @override
  _CustomNavigationRailState createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NavigationRail(
          extended: true,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.none,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.star),
              label: Text('Favorites'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
            // Add more NavigationRailDestinations as needed.
          ],
        ),
        VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Item 1'),
              ),
              ListTile(
                title: Text('Item 2'),
              ),
              ListTile(
                title: Text('Item 3'),
              ),
              ExpansionTile(
                title: Text('Expandable Items'),
                children: <Widget>[
                  ListTile(
                    title: Text('Subitem 1'),
                  ),
                  ListTile(
                    title: Text('Subitem 2'),
                  ),
                ],
              ),
              // Add more NavigationRailDestinations with ExpansionTile as needed.
            ],
          ),
        ),
      ],
    );
  }
}
