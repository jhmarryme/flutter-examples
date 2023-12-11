import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widget.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ScreenTypeLayout.builder(
          mobile: (p0) => WelcomeViewSmall(),
          tablet: (p0) => WelcomeViewLarge(),
          desktop: (p0) => WelcomeViewLarge(),
        ),
      ),
    );
  }
}

class WelcomeViewLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(flex: 3, child: WelcomeImage()),
        Spacer(flex: 1),
        Expanded(flex: 2, child: LoginAndSignupBtn()),
        Spacer(flex: 1),
      ],
    );
  }
}

class WelcomeViewSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          WelcomeImage(),
          Row(
            children: [
              Spacer(flex: 2),
              Expanded(flex: 5, child: LoginAndSignupBtn()),
              Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
