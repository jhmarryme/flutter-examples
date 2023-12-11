import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xFF6F35A5),
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
            child: Text("Login".toUpperCase(),
                style: const TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFFF1E6FF),
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
          child: Text(
            "Sign Up".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "WELCOME TO TEST_IN_ACTION",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // const SizedBox(height: 4.0 * 2),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 4,
                child: SvgPicture.asset("assets/login/icons/chat.svg"),
              ),
              const Spacer(),
            ],
          ),
          // const SizedBox(height: 4.0 * 2),
        ],
      ),
    );
  }
}
