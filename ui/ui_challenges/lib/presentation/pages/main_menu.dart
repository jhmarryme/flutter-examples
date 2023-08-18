import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenges/models/menu.dart' as menu;

import '../route.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _buildMenuPage();

  Scaffold _buildMenuPage() {
    List<ExpansionTile> pageList = pages.mapIndexed((index, menus) {
      return ExpansionTile(
          title: Text(menus.title),
          children: menus.items!.mapIndexed((index, subMenu) {
            return ListTile(
              title: Text(subMenu.title),
              onTap: () => _openPage(context, subMenu),
            );
          }).toList());
    }).toList();

    return Scaffold(
      body: SingleChildScrollView(child: Column(children: [...pageList])),
    );
  }

  void _openPage(BuildContext context, menu.SubMenuItem item) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => item.page));
  }
}
