import 'package:flutter/material.dart';
import 'package:flutter_trip/widgets/small/model/LocalNavData.dart';
import 'package:flutter_trip/widgets/webview/webview_page.dart';

/// 实现一组本地导航数据。每个导航项由一个图标和一个标题垂直排列组成
class LocalNavWidget extends StatelessWidget {
  final List<LocalNavData> localNavDataList;

  const LocalNavWidget({super.key, required this.localNavDataList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Row(
          // 对齐方式, 均匀分配空间, 首尾不留空
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: localNavDataList.map(
            (localNavData) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WebViewPage(
                        url: localNavData.url, title: localNavData.title);
                  }));
                },
                child: Column(children: [
                  Image.network(localNavData.icon, width: 32, height: 32),
                  Text(localNavData.title,
                      style: const TextStyle(fontSize: 12)),
                ]),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
