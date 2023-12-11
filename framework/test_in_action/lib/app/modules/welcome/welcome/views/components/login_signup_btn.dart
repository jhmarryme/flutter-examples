import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_in_action/app/routes/router_define.dart';
import 'package:test_in_action/common/constants/style_constants.dart';

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
            onPressed: () =>
                GoRouter.of(context).goNamed(WelcomeRouterDefine.login.name),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: StyleConstants.kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
            child: Text("Login".toUpperCase()),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: StyleConstants.kPrimaryLightColor,
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
