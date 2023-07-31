import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/model/GridNav.dart';
import 'package:flutter_trip/dao/model/SubItem.dart';
import 'package:flutter_trip/widgets/small/web_view_gesture_wrap.dart';

/// 网格卡片
/// 先不考虑空值问题
class GridCardOld extends StatelessWidget {
  final List<GridNav>? gridNav;

  const GridCardOld({Key? key, this.gridNav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: gridNav!
            .mapIndexed(
                (index, element) => _gridNavRow(context, index, element))
            .toList(),
      ),
    );
  }

  Widget _gridNavRow(BuildContext context, int index, GridNav item) {
    Color startColor = Color(int.parse('0xff${item.startColor}'));
    Color endColor = Color(int.parse('0xff${item.endColor}'));
    return Container(
      height: 88,
      margin: index == 0 ? null : const EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [startColor, endColor]),
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: _mainItem(context, item.mainItem)),
          Expanded(
              flex: 1,
              child: _doubleItem(context, item.items?[0], item.items?[1])),
          Expanded(
              flex: 1,
              child: _doubleItem(context, item.items?[1], item.items?[2])),
        ],
      ),
    );
  }

  Widget _mainItem(BuildContext context, SubItem? mainItem) {
    return WebViewPageGestureWrap.wrap(
        context: context,
        url: mainItem!.url!,
        title: mainItem.title!,
        child: Stack(
          children: [
            Image.network(
              mainItem.icon!,
              width: 121,
              height: 88,
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
            Container(
              // margin: EdgeInsets.only(top: 11),
              child: Text(
                mainItem.title!,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ));
  }

  Widget _doubleItem(BuildContext context, SubItem? item1, SubItem? item2) {
    return Column(
      children: [
        Expanded(flex: 1, child: _item(context, item1, true)),
        Expanded(flex: 1, child: _item(context, item2, false)),
      ],
    );
  }

  FractionallySizedBox _item(
      BuildContext context, SubItem? item, bool bottomBorder) {
    var borderSide = const BorderSide(color: Colors.white, width: 0.8);
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: borderSide,
            bottom: bottomBorder ? borderSide : BorderSide.none,
          ),
        ),
        child: WebViewPageGestureWrap.wrap(
          context: context,
          title: item!.title!,
          url: item.url!,
          child: Center(
            child: Text(
              item.title!,
              style: const TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
