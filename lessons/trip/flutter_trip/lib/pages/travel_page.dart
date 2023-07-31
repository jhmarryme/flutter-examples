import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/model/travel_model.dart';
import 'package:flutter_trip/dao/travel_dao.dart';
import 'package:flutter_trip/pages/travel_tab_page.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  late TabController _tabController;

  List<Tabs> _tabs = [];
  TravelModel _travelModel = TravelModel();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 0, vsync: this);
    TravelDao.fetch().then((value) {
      setState(() {
        _tabController = TabController(length: value.tabs!.length, vsync: this);
        _tabs = value.tabs!;
        _travelModel.url = value.url;
        _travelModel.params = value.params;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 20),
            child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: Colors.black,
                labelPadding: EdgeInsets.fromLTRB(20, 0, 10, 5),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3, color: Color(0xff2fcfbb)),
                  insets: EdgeInsets.only(bottom: 10),
                ),
                tabs: _tabs.map((element) {
                  return Tab(text: element.labelName);
                }).toList()),
          ),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: _tabs.map((e) {
                return TravelTabPage(
                  groupChannelCode: e.groupChannelCode!,
                  params: _travelModel.params!.toJson(),
                  travelUrl: _travelModel.url!,
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
