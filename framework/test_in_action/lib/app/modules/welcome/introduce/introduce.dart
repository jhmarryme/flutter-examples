import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:test_in_action/app/routes/parts/go_router_navigation_helper.dart';
import 'package:test_in_action/common/constants/colors.dart';

class IntroduceView extends StatefulWidget {
  const IntroduceView({super.key});

  @override
  _IntroduceViewState createState() => _IntroduceViewState();
}

class _IntroduceViewState extends State<IntroduceView> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    GoRouterNavigationHelper.goNamedWithContext(
        context, WelcomeRouterDefine.login.name);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 17.0,
      color: ColorStyle.kGrey500,
    );
    var pageDecoration = PageDecoration(
      footerPadding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      titleTextStyle: const TextStyle(fontSize: 28.0, color: ColorStyle.kBlack),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body: "Search and compare prices for flights around the world.",
          image: Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
                'assets/images/introduce/Flight-Booking-pana.svg',
                width: 350.0),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Booking",
          body: "Book a flight through simple steps and pay securely.",
          image: Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
                'assets/images/introduce/Flight-Booking-bro.svg',
                width: 350.0),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Title of last page",
          body: "Save your search and get notifications when prices change.",
          footer: ElevatedButton(
            onPressed: () {
              GoRouterNavigationHelper.goNamed(WelcomeRouterDefine.login.name);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorStyle.kBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              minimumSize: Size(200, MediaQuery.of(context).size.height * 0.05),
            ),
            child: const Text(
              "Enable Notification",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: ColorStyle.kWhite),
            ),
          ),
          image: Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
                'assets/images/introduce/Subscriber-bro.svg',
                width: 350.0),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      // skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip',
          style: TextStyle(color: ColorStyle.kGrey500, fontSize: 15)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: ColorStyle.kGrey400,
        activeColor: ColorStyle.kBlue,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
      ),
    );
  }
}
