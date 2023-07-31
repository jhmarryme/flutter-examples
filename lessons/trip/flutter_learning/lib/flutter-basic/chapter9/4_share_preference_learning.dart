import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceLearning extends StatefulWidget {
  const SharePreferenceLearning({Key? key}) : super(key: key);

  @override
  _SharePreferenceLearningState createState() =>
      _SharePreferenceLearningState();
}

class _SharePreferenceLearningState extends State<SharePreferenceLearning> {
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shared_preferences'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: _incrementCounter, child: Text('Increment Counter')),
            ElevatedButton(onPressed: _getCounter, child: Text('Get Counter')),
            Text(
              countString,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'result：' + localCount,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + " 1";
    });
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }

  _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();
    });
  }
}
