import 'package:flutter/material.dart';

// StatelessWidget与基础组件 学习
class StatelessWidgetLearning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget与基础组件'),
          // 手势检测
          leading: GestureDetector(
            onTap: () {
              // 点击返回上一层
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.limeAccent),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                'I am Text',
                style: style,
              ),
              Icon(
                Icons.android,
                size: 50,
                color: Colors.deepOrange,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                  // 材料设计中一个非常有趣的小部件，什么是Chip@https://material.io/design/components/chips.html
                  label: Text('Chip text'),
                  avatar: Icon(
                    Icons.people,
                  )),
              Divider(
                height: 10, // 容器高度，不是线的高度
                indent: 10, // 左侧间距
                color: Colors.black87,
              ),
              Card(
                // 带有圆角，阴影，边框等效果的卡片
                color: Colors.blueGrey,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'I am a Card',
                    style: style,
                  ),
                ),
              ),
              AlertDialog(
                title: Text('????'),
                content: Text('!!!!!!'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
