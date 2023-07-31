import 'package:flutter/material.dart';

///如何导入和使用Flutter的资源文件？
class ResourceLearning extends StatefulWidget {
  @override
  _ResourceLearningState createState() => _ResourceLearningState();
}

class _ResourceLearningState extends State<ResourceLearning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何导入和使用Flutter的资源文件？'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 两种方式都可以
            Image(
              width: 100,
              height: 100,
              image: AssetImage('asserts/images/avatar.png'),
            ),
            Image.asset(
              'asserts/images/avatar.png',
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
