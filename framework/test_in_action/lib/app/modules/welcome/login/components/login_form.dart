import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/business/already_have_an_account_acheck.dart';
import 'package:test_in_action/common/constants/style_constants.dart';

import '../login_logic.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LoginLogic>();
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: logic.usernameTextController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: StyleConstants.kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(StyleConstants.defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: StyleConstants.defaultPadding),
            child: TextFormField(
              controller: logic.passwordTextController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: StyleConstants.kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(StyleConstants.defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: StyleConstants.defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () => logic.login(),
              child: Text("Login".toUpperCase()),
            ),
          ),
          const SizedBox(height: StyleConstants.defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () => null,
          ),
        ],
      ),
    );
  }
}
