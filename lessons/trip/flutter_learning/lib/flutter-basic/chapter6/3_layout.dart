import 'package:flutter/material.dart';

class LayoutLearning extends StatefulWidget {
  const LayoutLearning({Key? key}) : super(key: key);

  @override
  State<LayoutLearning> createState() => _LayoutLearningState();
}

class _LayoutLearningState extends State<LayoutLearning> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何进行Flutter布局开发？',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何进行Flutter布局开发？'),
          leading: GestureDetector(
            onTap: () => {
              Navigator.pop(context),
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.tealAccent),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    children: [
                      // 使用SizedBox包裹，为child设置width和height
                      ClipOval(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(
                              'http://www.devio.org/img/avatar.png'),
                        ),
                      ),
                      // 如果child的widget有width和height，则可以不使用SizedBox包裹
                      ClipOval(
                        child: Image.network(
                          'http://www.devio.org/img/avatar.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: ClipRRect(
                          // 圆角
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Opacity(
                            opacity: 0.6, // 60%透明度
                            child: Image.network(
                              'http://www.devio.org/img/avatar.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.deepPurple),
                          child: Text('宽度'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Image.network(
                  'http://www.devio.org/img/avatar.png',
                  width: 100,
                  height: 100,
                ),
                Positioned(
                    left: 0,
                    bottom: 0,
                    child: Image.network(
                      'http://www.devio.org/img/avatar.png',
                      width: 36,
                      height: 36,
                    ))
              ],
            ),
            Wrap(
              // 创建一个wrap布局，从左向右进行排列，会自动换行
              spacing: 8, //水平间距
              runSpacing: 6, //垂直间距
              children: <Widget>[
                _chip('Flutter'),
                _chip('进阶'),
                _chip('实战'),
                _chip('携程'),
                _chip('App'),
              ],
            ),
            Container(
              height: 200,
              child: Column(
                children: [
                  Text('列表'),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(color: Colors.deepOrange),
                    child: Text('拉伸填满高度'),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
