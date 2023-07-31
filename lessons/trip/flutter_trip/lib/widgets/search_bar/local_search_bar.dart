import 'package:flutter/material.dart';

enum SearchBarType { home, normal, homeLight }

/// 自定义的搜索栏组件
/// 根据不同的搜索栏类型（SearchBarType），呈现不同的样式
///
class LocalSearchBar extends StatefulWidget {
  /// 是否启用，目前都为启用
  final bool? enabled;

  /// 是否隐藏左边的返回按钮
  final bool? hideLeft;

  /// 为homePage和searchPage设计，homePage实际是假搜索框，点击后跳转searchPage
  final SearchBarType? searchBarType;

  /// 输入框文本
  final String? defaultText;

  /// 提示信息
  final String? hint;

  /// searchBar 左边的返回按钮事件
  final void Function()? leftButtonClick;

  /// searchBar 右边的搜索按钮事件
  final void Function()? rightButtonClick;

  /// 语音搜索按钮，暂不考虑实现
  final void Function()? speakClick;

  /// 搜索框的点击事件，用于homePage页点击跳转到searchPage
  final void Function()? inputBoxClick;

  /// textFiled change事件时会回调，处理实时搜索事件
  final ValueChanged<String>? onChanged;

  const LocalSearchBar(
      {Key? key,
      this.enabled = true,
      this.hideLeft,
      this.searchBarType = SearchBarType.normal,
      this.defaultText,
      this.hint,
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  _LocalSearchBarState createState() => _LocalSearchBarState();
}

class _LocalSearchBarState extends State<LocalSearchBar> {
  /// 用于输入框显示清除按钮，输入框有内容为true
  bool showClear = false;

  /// textFiled控制器
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    /// 如果有默认的搜索文本，则触发textFiled内容变更以触发实时搜索
    if (widget.defaultText != null) {
      setState(() {
        _textEditingController.text = widget.defaultText!;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _normalSearch()
        : _homeSearch();
  }

  /// 用于给searchPage使用
  _normalSearch() {
    return Container(
      child: Row(children: [
        _wrapTap(
          Container(
            padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
            child: widget.hideLeft ?? false
                ? null
                : Icon(Icons.arrow_back_ios, color: Colors.grey, size: 26),
          ),
          widget.leftButtonClick,
        ),
        Expanded(flex: 1, child: _inputBox()),
        _wrapTap(
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child:
                Text('搜索', style: TextStyle(color: Colors.blue, fontSize: 17)),
          ),
          widget.rightButtonClick,
        )
      ]),
    );
  }

  /// 用于给homePage使用
  _homeSearch() {
    return Container(
      child: Row(children: <Widget>[
        _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(6, 5, 5, 5),
              child: Row(
                children: <Widget>[
                  Text(
                    '上海',
                    style: TextStyle(color: _homeFontColor(), fontSize: 14),
                  ),
                  Icon(Icons.expand_more, color: _homeFontColor(), size: 22)
                ],
              ),
            ),
            widget.leftButtonClick),
        Expanded(flex: 1, child: _inputBox()),
        _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Icon(Icons.comment, color: _homeFontColor(), size: 26),
            ),
            widget.rightButtonClick),
      ]),
    );
  }

  _inputBox() {
    Color inputBoxColor = SearchBarType.home == widget.searchBarType
        ? Colors.white
        : Color(int.parse('0xffEDEDED'));
    return Container(
      height: 35,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: inputBoxColor,
        borderRadius: BorderRadius.circular(
          SearchBarType.home == widget.searchBarType ? 15 : 5,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 20,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(0xffA9A9A9)
                : Colors.blue,
          ),

          /// SearchBarType.normal为TextFiled实现，SearchBarType.home仅展示Text
          Expanded(
            flex: 1,
            child: widget.searchBarType == SearchBarType.normal
                ? TextField(
                    controller: _textEditingController,
                    onChanged: _onChanged,
                    autofocus: true,
                    // textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        textBaseline: TextBaseline.alphabetic),
                    //输入文本的样式
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      border: InputBorder.none,
                      isDense: true,
                      hintText: widget.hint ?? '',
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                  )
                : _wrapTap(
                    Container(
                      child: Text(
                        widget.defaultText!,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                    widget.inputBoxClick,
                  ),
          ),
          showClear
              ? _wrapTap(
                  Icon(Icons.clear, size: 22, color: Colors.grey),
                  () {
                    setState(() {
                      _textEditingController.clear();
                    });
                    _onChanged('');
                  },
                )
              : _wrapTap(
                  Icon(
                    Icons.mic,
                    size: 22,
                    color: widget.searchBarType == SearchBarType.normal
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  widget.speakClick,
                )
        ],
      ),
    );
  }

  /// 简单再包裹一下点击事件
  _wrapTap(Widget child, void Function()? callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  /// textFiled change触发时回调widget.onChanged
  _onChanged(String text) {
    setState(() {
      showClear = text.isNotEmpty;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(text);
    }
  }

  _homeFontColor() {
    return widget.searchBarType == SearchBarType.homeLight
        ? Colors.black54
        : Colors.white;
  }
}
