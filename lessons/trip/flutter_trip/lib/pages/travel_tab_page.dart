import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_trip/dao/model/travel_tab_model.dart';
import 'package:flutter_trip/dao/travel_tab_dao.dart';
import 'package:flutter_trip/widgets/small/loading_container.dart';
import 'package:flutter_trip/widgets/small/web_view_gesture_wrap.dart';

class TravelTabPage extends StatefulWidget {
  final String travelUrl;
  final Map params;
  final String groupChannelCode;

  const TravelTabPage(
      {Key? key,
      required this.travelUrl,
      required this.params,
      required this.groupChannelCode})
      : super(key: key);

  @override
  _TravelTabPageState createState() => _TravelTabPageState();
}

class _TravelTabPageState extends State<TravelTabPage> {
  List<ResultList> travelItem = [];
  final ScrollController _scrollController = ScrollController();
  int _pageIndex = 1;
  var _isLoading = true;

  @override
  void initState() {
    _loadData();
    _scrollController.addListener(() {
      // 监听列表的滚动事件，当滑动到列表底部时，会触发加载更多的数据。
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData(loadMore: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingContainer(
        isLoading: _isLoading,
        cover: true,
        child: RefreshIndicator(
          child: MasonryGridView.count(
            controller: _scrollController,
            crossAxisCount: 2,
            itemCount: travelItem.length,
            itemBuilder: (BuildContext context, int index) =>
                _TravelItem(item: travelItem[index], index: index),
            mainAxisSpacing: 6,
            crossAxisSpacing: 10,
          ),
          onRefresh: _onRefresh,
        ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadData({loadMore = false}) {
    // 下拉加载更多时加载下一页数据, 否则加载第一页数据
    _pageIndex = loadMore ? _pageIndex++ : 1;
    TravelTabDao.fetch(
      widget.travelUrl,
      widget.params,
      widget.groupChannelCode,
      _pageIndex,
    ).then((value) {
      _isLoading = false;
      setState(() {
        // 下拉加载更多时保留原有数据, 否则先清空
        travelItem = loadMore ? travelItem : [];
        print(travelItem.length);
        travelItem.addAll(value.resultList ?? []);
        print(travelItem.length);
      });
    }).catchError((e) {
      _isLoading = false;
    });
  }

  Future<void> _onRefresh() async {
    _loadData();
  }
}

class _TravelItem extends StatelessWidget {
  final ResultList item;
  final int index;

  const _TravelItem({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebViewPageGestureWrap.wrap(
      child: Card(
        child: PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _itemImage(),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  item.article!.articleTitle!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
              _infoText()
            ],
          ),
        ),
      ),
      context: context,
      // todo filter h5url
      url: (item.article?.urls
                      ?.where((element) => element.h5Url?.isNotEmpty ?? false)
                      .toList() ??
                  [])
              .first
              .h5Url ??
          '',
      title: 'detail',
    );
  }

  _itemImage() {
    return Stack(
      children: <Widget>[
        Image.network(item.article!.images![0].dynamicUrl ?? ''),
        Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 3),
                  child: Icon(Icons.location_on, color: Colors.white, size: 12),
                ),
                LimitedBox(
                  maxWidth: 130,
                  child: Text(
                    _poiName(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ]),
            ))
      ],
    );
  }

  String _poiName() {
    var nameList = item.article?.pois
            ?.where((e) => e.poiName?.isNotEmpty ?? false)
            .toList() ??
        [];
    return nameList.first.poiName ?? '未知';
  }

  _infoText() {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 0, 6, 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              PhysicalModel(
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.article?.author?.coverImage?.dynamicUrl ?? '',
                  width: 24,
                  height: 24,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 90,
                child: Text(
                  item.article?.author?.nickName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
              )
            ]),
            Row(children: <Widget>[
              Icon(Icons.thumb_up, size: 14, color: Colors.grey),
              Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text(
                  item.article?.likeCount?.toString() ?? '0',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ]),
          ]),
    );
  }
}
