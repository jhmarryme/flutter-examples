import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_trip/dao/model/search_model.dart';
import 'package:flutter_trip/dao/search_dao.dart';
import 'package:flutter_trip/widgets/search_bar/local_search_bar.dart';
import 'package:flutter_trip/widgets/small/web_view_gesture_wrap.dart';

class SearchPage extends StatefulWidget {
  final bool? hideLeft;
  final String? keyword;
  final String? hint;

  const SearchPage({Key? key, this.hideLeft = true, this.keyword, this.hint})
      : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel? searchModel;
  String? keyword;

  @override
  void initState() {
    if (widget.keyword != null) {
      _onTextChanged(widget.keyword!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appbar(),
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Expanded(
              child: ListView.builder(
                itemCount: searchModel?.data?.length ?? 0,
                itemBuilder: (context, index) => _item(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onTextChanged(String text) {
    keyword = text;
    if (text.isEmpty) {
      setState(() {
        searchModel = null;
      });
      return;
    }
    SearchDao.search(text).then((value) {
      setState(() {
        searchModel = value;
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  _appbar() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 30),
            height: 80,
            decoration: const BoxDecoration(color: Colors.white),
            child: LocalSearchBar(
              hideLeft: widget.hideLeft,
              hint: 'test',
              leftButtonClick: () => Navigator.pop(context),
              onChanged: _onTextChanged,
            ),
          ),
        ),
      ],
    );
  }

  _item(int index) {
    if (searchModel == null || searchModel?.data == null) {
      return null;
    }
    var model = searchModel!.data![index];
    return WebViewPageGestureWrap.wrap(
        child: Container(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.3, color: Colors.grey)),
            ),
            child: Row(
              children: [
                Container(child: _image(model.type)),
                Container(child: _title(model))
              ],
            ),
          ),
        ),
        context: context,
        url: model.url!,
        title: '详情');
  }

  _title(Data model) {
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(model.word!, keyword!));
    spans.add(TextSpan(text: model.districtname));
    return RichText(text: TextSpan(children: spans));
  }

  Widget _image(String? imageName) {
    var assetPath = 'assets/images/search/type_$imageName.png';
    var exist = false;

    return FutureBuilder(
        future: checkAssetFileExists(assetPath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            exist = snapshot.hasData && snapshot.data == true;
            // print('exist: $exist');
            return Image.asset(
              exist ? assetPath : 'assets/images/search/type_shop.png',
              height: 26,
              width: 26,
            );
          } else {
            // print('doing');
            return Container();
          }
        });
  }

  Future<bool> checkAssetFileExists(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (_) {
      return false;
    }
  }

  List<TextSpan> _keywordTextSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    if (word.isEmpty) return spans;
    // 搜索关键字高亮忽略大小写
    String wordL = word.toLowerCase(), keywordL = keyword.toLowerCase();
    List<String> arr = wordL.split(keywordL);
    TextStyle normalStyle =
        const TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordStyle =
        const TextStyle(fontSize: 16, color: Colors.orange);
    // 'wordwoc'.split('w') -> [, ord, oc] @https://www.tutorialspoint.com/tpcg.php?p=wcpcUA
    int preIndex = 0;
    for (int i = 0; i < arr.length; i++) {
      if (i != 0) {
        // 搜索关键字高亮忽略大小写
        preIndex = wordL.indexOf(keywordL, preIndex);
        spans.add(TextSpan(
            text: word.substring(preIndex, preIndex + keyword.length),
            style: keywordStyle));
      }
      String val = arr[i];
      if (val.isNotEmpty) {
        spans.add(TextSpan(text: val, style: normalStyle));
      }
    }
    return spans;
  }
}
