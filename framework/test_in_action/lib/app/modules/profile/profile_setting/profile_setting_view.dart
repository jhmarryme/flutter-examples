import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_in_action/app/components/business/list_title/profile_list_tile.dart';
import 'package:test_in_action/app/routes/parts/go_router_navigation_helper.dart';

class ProfileSettingView extends StatelessWidget {
  const ProfileSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileListTile(
              leadingIcon: FontAwesomeIcons.envelope,
              title: "MyEmail",
              onTap: () {
                GoRouterNavigationHelper.pushNamedWithContext(
                    context, ProfileRouterDefine.profileSettingEmail.name);
              },
            ),
            ProfileListTile(
              leadingIcon: FontAwesomeIcons.phone,
              title: "LinkPhoneNumber",
              onTap: () {},
            ),
            ProfileListTile(
              leadingIcon: FontAwesomeIcons.solidCreditCard,
              title: "MyCards",
              onTap: () {},
            ),
            ProfileListTile(
              leadingIcon: FontAwesomeIcons.link,
              title: "LinkedAccounts",
              onTap: () {},
            ),
            ProfileListTile(
              leadingIcon: FontAwesomeIcons.pencil,
              title: "DisplayName",
              onTap: () {},
            ),
            ProfileListTile(
              leadingIcon: FontAwesomeIcons.key,
              title: "ResetPassword",
              onTap: () {},
            ),
            ProfileListTile(
              leadingIcon: FontAwesomeIcons.trash,
              title: "DeleteMyAccount",
              showDivider: false,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
