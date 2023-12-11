import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Container(),
          ElevatedButton(
            onPressed: () => GoRouter.of(context).pop(),
            child: const Text("go back index"),
          ),
        ],
      ),
    );
  }
}
