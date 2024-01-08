import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    var pageDecoration = PageDecoration(
      footerPadding: EdgeInsets.only(top: 1.sh * 0.05),
      titleTextStyle: TextStyle(fontSize: 28.0.spMin),
      bodyTextStyle:
          TextStyle(fontSize: 17.0.spMin, color: ColorStyle.kGrey500),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(top: 30.spMin),
    );

    return Scaffold(
      body: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: "Fractional shares",
            body: "Search and compare prices for flights around the world.",
            image: Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                  'assets/images/introduce/Flight-Booking-pana.svg',
                  width: 350.0.spMin),
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
                  width: 350.0.spMin),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Title of last page",
            body: "Save your search and get notifications when prices change.",
            footer: Padding(
              padding: EdgeInsets.only(right: 0.2.sw, left: 0.2.sw),
              child: ElevatedButton(
                onPressed: () {
                  GoRouterNavigationHelper.goNamed(
                      WelcomeRouterDefine.login.name);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorStyle.kBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  // minimumSize: Size(100.spMin, 50.spMin),
                ),
                child: Text(
                  "Enable Notification",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 18.spMin, color: ColorStyle.kWhite),
                ),
              ),
            ),
            image: Align(
              // alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                  'assets/images/introduce/Subscriber-bro.svg',
                  width: 350.0.spMin),
            ),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        // skipFlex: 0,
        nextFlex: 0,
        skip: Text('Skip',
            style: TextStyle(color: ColorStyle.kGrey500, fontSize: 15.spMin)),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
          size: Size(10.0.spMin, 10.0.spMin),
          color: ColorStyle.kGrey400,
          activeColor: ColorStyle.kBlue,
          activeSize: Size(22.0.spMin, 10.0.spMin),
          activeShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
      ),
    );
  }
}
