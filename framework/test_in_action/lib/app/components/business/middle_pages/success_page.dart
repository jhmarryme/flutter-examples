import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          elevation: 0.0,
          bottomOpacity: 0.0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
          centerTitle: true,
          title: const Text('Success Page'),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 1.sw * 0.05, right: 1.sw * 0.05),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 1.sh * 0.05, bottom: 1.sh * 0.05),
              child: ClipOval(
                child: Image(
                  width: 1.sw * 0.15,
                  height: 1.sh * 0.15,
                  image: const AssetImage('assets/images/avatar.png'),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child:
                  const Text("Congratulations", style: TextStyle(fontSize: 17)),
            ),
            Container(
              margin: EdgeInsets.only(top: 1.sh * 0.05, bottom: 1.sh * 0.05),
              child: AutoSizeText(text, presetFontSizes: const [17, 14, 11, 8]),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Done', textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
