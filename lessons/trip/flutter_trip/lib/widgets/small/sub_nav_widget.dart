import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/widgets/small/model/icon_webview_model.dart';

class SubNavWidget extends StatelessWidget {
  final List<IconWebViewModel>? iconWebViewModels;

  const SubNavWidget({Key? key, this.iconWebViewModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: _toSubNavRows(iconWebViewModels),
      ),
    );
  }

  Column _toSubNavRows(List<IconWebViewModel>? iconWebViewModels) {
    var length = iconWebViewModels?.length ?? 0;
    var separate = (length / 2 + 0.5).toInt();
    List<Widget> widgets = iconWebViewModels!
        .mapIndexed((index, element) => _item(index, element))
        .toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(children: widgets.sublist(0, separate)),
        ),
        Row(children: widgets.sublist(separate, length)),
      ],
    );
  }

  Widget _item(int index, IconWebViewModel element) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Image.network(element.icon, height: 18, width: 18),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(element.title, style: const TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
