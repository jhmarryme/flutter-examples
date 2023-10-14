import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

void main() => runApp(
      MaterialApp(
        home: Material(
          child: Scaffold(
            body: Row(
              children: [
                SideMenu(
                  builder: (data) => SideMenuData(
                    header: const Text('Header'),
                    items: [
                      SideMenuItemDataTile(
                        isSelected: true,
                        onTap: () {},
                        title: 'Item 1',
                        icon: const Icon(Icons.home),
                      ),
                    ],
                    footer: const Text('Footer'),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        'body',
                      ),
                    ),
                  ),
                ),
                SideMenu(
                  position: SideMenuPosition.right,
                  builder: (data) => const SideMenuData(
                    customChild: Text('Custom view'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
