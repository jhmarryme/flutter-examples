import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/HomePageDao.dart';
import 'package:flutter_trip/dao/model/Banner.dart';
import 'package:flutter_trip/dao/model/GridNav.dart';
import 'package:flutter_trip/dao/model/LocalNav.dart';
import 'package:flutter_trip/dao/model/SubNav.dart';
import 'package:flutter_trip/dao/model/sales_box_model.dart';
import 'package:flutter_trip/widgets/small/grid_card_old.dart';
import 'package:flutter_trip/widgets/small/loading_container.dart';
import 'package:flutter_trip/widgets/small/local_nav_widget.dart';
import 'package:flutter_trip/widgets/small/model/LocalNavData.dart';
import 'package:flutter_trip/widgets/small/model/icon_webview_model.dart';
import 'package:flutter_trip/widgets/small/sales_box_widget.dart';
import 'package:flutter_trip/widgets/small/sub_nav_widget.dart';
import 'package:flutter_trip/widgets/small/web_view_gesture_wrap.dart';

const appbarScrollOffset = 100;

/// 课程13章之前的homePage，13章后会引用searchBar
class HomePageOld extends StatefulWidget {
  const HomePageOld({Key? key}) : super(key: key);

  @override
  State<HomePageOld> createState() => _HomePageOldState();
}

class _HomePageOldState extends State<HomePageOld> {
  double appBarAlpha = 0;
  List<LocalNav> localNavList = [];
  List<GridNav>? gridNav = [];
  List<SubNav>? subNav = [];
  List<SubBanner>? bannerList = [];
  SalesBox? salesBox;

  var _isLoading = true;

  @override
  void initState() {
    _handleRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: LoadingContainer(
        isLoading: _isLoading,
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Stack(
            children: [
              // 在 ListView 中，即使控件在最上面，距离上面也有一部分距离，通过MediaQuery移除上面的距离
              MediaQuery.removePadding(
                context: context,
                // 指定移除哪边的padding
                removeTop: true,
                // 监听滚动
                child: NotificationListener(
                    onNotification: _onNotification, child: _contentListView()),
              ),
              _appBar(),
            ],
          ),
        ),
      ),
    );
  }

  ListView _contentListView() {
    const edgeInsets = EdgeInsets.fromLTRB(7, 4, 7, 4);
    return ListView(
      children: [
        buildSizedBox(),
        Padding(
          padding: edgeInsets,
          child: LocalNavWidget(
            localNavDataList:
                localNavList.map((e) => LocalNavData.fromLocalNav(e)).toList(),
          ),
        ),
        Padding(padding: edgeInsets, child: GridCardOld(gridNav: gridNav)),
        Padding(
          padding: edgeInsets,
          child: SubNavWidget(
            iconWebViewModels:
                subNav!.map((e) => IconWebViewModel.fromSubNav(e)).toList(),
          ),
        ),
        Padding(padding: edgeInsets, child: SalesBoxWidget(salesBox: salesBox)),
      ],
    );
  }

  /// 自定义简易悬浮appbar
  Opacity _appBar() {
    return Opacity(
      opacity: appBarAlpha,
      child: Container(
        height: 60,
        decoration: const BoxDecoration(color: Colors.white),
        child: const Center(
          child: Padding(padding: EdgeInsets.only(top: 20), child: Text('0')),
        ),
      ),
    );
  }

  // 滚动事件监听
  bool _onNotification(notification) {
    // 发生滚动并且深度为0, 指向ListView
    if (notification is ScrollUpdateNotification && notification.depth == 0) {
      // pixels为当前的绝对位置
      _onScroll(notification.metrics.pixels);
    }
    return false;
  }

  /// 图片banner
  SizedBox buildSizedBox() {
    return SizedBox(
      height: 160,
      child: Swiper(
        itemBuilder: (context, index) {
          return WebViewPageGestureWrap.wrap(
            child: Image.network(bannerList![index].icon!, fit: BoxFit.fill),
            context: context,
            url: bannerList![index].url!,
            title: '',
          );
        },
        itemCount: bannerList!.length,
        autoplay: true,
        // 默认3000
        autoplayDelay: 3000,
        // 手动滑动时禁用自动播放
        autoplayDisableOnInteraction: false,
        // 设置指示器, 也就是下面那个小点
        pagination: const SwiperPagination(),
        // 设置切换按钮, 也就是左右两个小箭头
        control: const SwiperControl(),
      ),
    );
  }

  /// 滚动时修正appBar的透明度
  void _onScroll(double pixels) {
    // 通过 绝对位置 / 100计算透明度, pixels = 0时完全透明, pixel = 100是完全不透明
    double alpha = pixels / appbarScrollOffset;
    if (alpha > 1) {
      alpha = 1;
    } else if (alpha < 0) {
      alpha = 0;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  Future<void> _handleRefresh() async {
    HomePageDao.sendDioGetRequest().then(
      (value) {
        setState(() {
          gridNav = value.gridNav;
          localNavList = value.localNavList;
          subNav = value.subNavList;
          salesBox = value.salesBox;
          bannerList = value.bannerList;
          // 延迟个一秒看看效果
          Future.delayed(const Duration(milliseconds: 1000)).then((value) {
            setState(() {
              _isLoading = false;
            });
          });
        });
      },
    ).catchError((onError) {
      print(onError);
      _isLoading = false;
    });
  }
}
