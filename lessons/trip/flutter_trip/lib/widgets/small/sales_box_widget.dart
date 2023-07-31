import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/model/card_model.dart';
import 'package:flutter_trip/dao/model/sales_box_model.dart';
import 'package:flutter_trip/widgets/small/web_view_gesture_wrap.dart';

class SalesBoxWidget extends StatelessWidget {
  final SalesBox? salesBox;

  const SalesBoxWidget({Key? key, this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: toSalesBoxRows(context, salesBox),
      ),
    );
  }

  List<Widget> toSalesBoxRows(BuildContext context, SalesBox? salesBoxes) {
    if (salesBox == null) {
      return [];
    }
    List<Widget> rows = [];
    int smallCardLength = salesBoxes!.smallCard!.length;
    int separate = (smallCardLength / 2 + 0.5).toInt();

    rows.add(
      // 第一行: 获取更多
      Container(
        height: 44,
        // margin: EdgeInsets.only(left: 11),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xfff2f2f2),
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.network(salesBoxes.icon!, height: 18, fit: BoxFit.fill),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 1, 8, 1),
              margin: const EdgeInsets.only(right: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    colors: [Color(0xffff4e63), Color(0xffff6cc9)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: WebViewPageGestureWrap.wrap(
                  context: context,
                  child: const Text('获取更多福利 >',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  url: salesBox!.moreUrl!,
                  title: '获取更多福利 >'),
            ),
          ],
        ),
      ),
    );
    // 后续三行: 两个图片一行
    rows.add(toSalesBoxRow(context, salesBoxes.bigCard, last: false));
    rows.add(toSalesBoxRow(context, salesBoxes.smallCard?.sublist(0, separate),
        last: false));
    rows.add(toSalesBoxRow(
        context, salesBoxes.smallCard?.sublist(separate, smallCardLength),
        last: true));
    return rows;
  }

  Row toSalesBoxRow(BuildContext context, List<CardInfo>? card,
      {bool? last = false}) {
    BorderSide borderSide =
        const BorderSide(width: 0.8, color: Color(0xfff2f2f2));
    return Row(
      children: card!.mapIndexed((index, element) {
        return Expanded(
            flex: 1,
            child: WebViewPageGestureWrap.wrap(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right:
                          ((index + 1) % 2) == 0 ? BorderSide.none : borderSide,
                      bottom: last ?? false ? BorderSide.none : borderSide,
                    ),
                  ),
                  child: Image.network(element.icon!),
                ),
                context: context,
                url: element.url!,
                title: element.title!));
      }).toList(),
    );
  }
}
