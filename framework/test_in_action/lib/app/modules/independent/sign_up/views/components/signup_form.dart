import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/buissiness/already_have_an_account_acheck.dart';
import 'package:test_in_action/app/routes/backup/app_pages.dart';
import 'package:test_in_action/common/constants/style_constants.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
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
              textInputAction: TextInputAction.done,
              obscureText: true,
              // cursorColor: StyleConstants.kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(StyleConstants.defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: StyleConstants.defaultPadding / 2),
          ElevatedButton(
            onPressed: () {},
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: StyleConstants.defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Get.toNamed(Routes.login);
            },
          ),
        ],
      ),
    );
  }
}
