import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/EasyRefreshStyle.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/quiz_entity.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/sample_get_page_logic.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/skeleton_item.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_widgets/my_easy_refresh.dart';

class NestedScrollViewPage extends StatefulWidget {
  const NestedScrollViewPage({Key? key}) : super(key: key);

  @override
  NestedScrollViewPageState createState() {
    return NestedScrollViewPageState();
  }
}

class NestedScrollViewPageState extends State<NestedScrollViewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _tabIndex = 0;
  int _listCount = 20;
  int _gridCount = 20;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SampleGetPageLogic<QuizEntity>(), tag: "nested sample 1");
    final themeData = Theme.of(context);
    return Scaffold(
      body: ExtendedNestedScrollView(
        onlyOneScrollInBody: true,
        pinnedHeaderSliverHeightBuilder: () {
          return MediaQuery.of(context).padding.top + kToolbarHeight;
        },
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 120,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'NestedScrollView',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color),
                ),
                centerTitle: false,
              ),
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            TabBar(
              controller: _tabController,
              labelColor: themeData.colorScheme.primary,
              indicatorColor: themeData.colorScheme.primary,
              onTap: (index) {
                setState(() {
                  _tabIndex = index;
                });
              },
              tabs: const <Widget>[
                Tab(text: 'List'),
                Tab(text: 'Grid'),
              ],
            ),
            Expanded(
              child: IndexedStack(
                index: _tabIndex,
                children: <Widget>[
                  ExtendedVisibilityDetector(
                    uniqueKey: const Key('Tab0'),
                    child: EasyRefresh(
                      header: EasyRefreshHeader.classicHeaderDefault(),
                      footer: EasyRefreshFooter.classicFooterDefault(),
                      child: CustomScrollView(
                        primary: false,
                        slivers: [
                          SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                            return const SkeletonItem();
                          }, childCount: _listCount)),
                          const FooterLocator.sliver(),
                        ],
                      ),
                      onRefresh: () async {
                        await Future.delayed(const Duration(seconds: 2), () {
                          if (mounted) {
                            setState(() {
                              _listCount = 20;
                            });
                          }
                        });
                      },
                      onLoad: () async {
                        await Future.delayed(const Duration(seconds: 2), () {
                          if (mounted) {
                            setState(() {
                              _listCount += 10;
                            });
                          }
                        });
                      },
                    ),
                  ),
                  ExtendedVisibilityDetector(
                    uniqueKey: const Key('Tab1'),
                    child: MyEasyRefresh<SampleGetPageLogic<QuizEntity>>(
                      tag: "nested sample 1",
                      child: CustomScrollView(
                        primary: false,
                        slivers: [
                          SliverGrid(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                return const SkeletonItem(
                                  direction: Axis.horizontal,
                                );
                              }, childCount: _gridCount),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 6 / 7,
                              )),
                          const FooterLocator.sliver(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
