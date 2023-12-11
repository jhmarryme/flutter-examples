import 'package:flutter/material.dart';

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: children.length,
    );
  }
}
