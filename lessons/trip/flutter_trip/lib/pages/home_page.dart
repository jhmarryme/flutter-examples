import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/HomePageDao.dart';
import 'package:flutter_trip/dao/model/Banner.dart';
import 'package:flutter_trip/dao/model/GridNav.dart';
import 'package:flutter_trip/dao/model/LocalNav.dart';
import 'package:flutter_trip/dao/model/SubNav.dart';
import 'package:flutter_trip/dao/model/sales_box_model.dart';
import 'package:flutter_trip/pages/SearchPage.dart';
import 'package:flutter_trip/widgets/search_bar/local_search_bar.dart';
import 'package:flutter_trip/widgets/small/grid_card_old.dart';
import 'package:flutter_trip/widgets/small/loading_container.dart';
import 'package:flutter_trip/widgets/small/local_nav_widget.dart';
import 'package:flutter_trip/widgets/small/model/LocalNavData.dart';
import 'package:flutter_trip/widgets/small/model/icon_webview_model.dart';
import 'package:flutter_trip/widgets/small/sales_box_widget.dart';
import 'package:flutter_trip/widgets/small/sub_nav_widget.dart';
import 'package:flutter_trip/widgets/small/web_view_gesture_wrap.dart';

const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

/// 课程13章后的homePage
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          child: Column(
            children: [
              _appBar(),
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Expanded(child: _contentListView()),
              ),
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
  _appBar() {
    return Container(
      padding: EdgeInsets.only(top: 25),
      decoration: BoxDecoration(color: Colors.black54),
      child: LocalSearchBar(
        searchBarType: SearchBarType.home,
        inputBoxClick: _jumpToSearch,
        defaultText: SEARCH_BAR_DEFAULT_TEXT,
        hideLeft: false,
      ),
    );
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

  void _jumpToSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(
          hint: SEARCH_BAR_DEFAULT_TEXT,
          hideLeft: false,
        ),
      ),
    );
  }
}
