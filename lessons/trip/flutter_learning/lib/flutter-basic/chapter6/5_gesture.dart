import 'package:flutter/material.dart';

// 如何检测用户手势以及处理点击事件 学习
class GestureLearning extends StatefulWidget {
  const GestureLearning({Key? key}) : super(key: key);

  @override
  State<GestureLearning> createState() => _GestureLearningState();
}

class _GestureLearningState extends State<GestureLearning> {
  String printString = '';
  double moveX = 0, moveY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何检测用户手势以及处理点击事件',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        // 如果不用FractionallySizedBox包裹, Positioned定义的小圆点只能在stack范围内活动
        body: FractionallySizedBox(
          // 让当前widget占满整个屏幕
          widthFactor: 1,
          heightFactor: 1,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey),
            child: Stack(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => _printMsg('点击'),
                      onDoubleTap: () => _printMsg('双击'),
                      onLongPress: () => _printMsg('长按'),
                      onTapCancel: () => _printMsg('取消'),
                      onTapUp: (e) => _printMsg('松开'),
                      onTapDown: (e) => _printMsg('按下'),
                      child: Container(
                        padding: EdgeInsets.all(60),
                        decoration: BoxDecoration(color: Colors.blueAccent),
                        child: Text(
                          '点我',
                          style: TextStyle(fontSize: 36, color: Colors.white),
                        ),
                      ),
                    ),
                    Text(printString),
                    ElevatedButton(
                        // 清空上面的Text内容
                        onPressed: () {
                          setState(() {
                            printString = '';
                          });
                        },
                        child: Icon(Icons.clear)),
                  ],
                ),
                Positioned(
                    // 跟着手指滑动的小球
                    left: moveX,
                    top: moveY,
                    child: GestureDetector(
                      // 处理拖动手势
                      onPanUpdate: (details) => _doMove(details),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(36)),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _printMsg(String msg) {
    setState(() {
      printString += ' ,$msg';
    });
  }

  /// 通过偏移量实现小球的移动
  _doMove(DragUpdateDetails details) {
    print('$details');
    setState(() {
      moveX += details.delta.dx;
      moveY += details.delta.dy;
    });
  }
}
