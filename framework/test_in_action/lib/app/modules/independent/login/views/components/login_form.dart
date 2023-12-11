import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/buissiness/already_have_an_account_acheck.dart';
import 'package:test_in_action/app/modules/independent/login/login_logic.dart';
import 'package:test_in_action/app/routes/backup/app_pages.dart';
import 'package:test_in_action/common/constants/style_constants.dart';

class LoginFormBack extends StatelessWidget {
  const LoginFormBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LoginLogicBack>();
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
            press: () => Get.toNamed(Routes.home),
          ),
        ],
      ),
    );
  }
}
