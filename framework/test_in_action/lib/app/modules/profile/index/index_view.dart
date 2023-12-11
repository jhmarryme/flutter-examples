import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_in_action/app/components/business/list_title/profile_list_tile.dart';
import 'package:test_in_action/app/routes/parts/go_router_navigation_helper.dart';

import 'components/personal_informaintion.dart';

class ProfileIndexView extends StatelessWidget {
  const ProfileIndexView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PersonalInformation(),
            Card(
              elevation: 0.5,
              margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
              child: Column(
                children: [
                  ProfileListTile(
                    leadingIcon: FontAwesomeIcons.solidCircleUser,
                    title: "Profile",
                    onTap: () {
                      GoRouterNavigationHelper.pushNamedWithContext(
                          context, ProfileRouterDefine.profileSetting.name);
                    },
                  ),
                  ProfileListTile(
                    leadingIcon: FontAwesomeIcons.user,
                    title: "Passengersinfo",
                    onTap: () {},
                  ),
                  ProfileListTile(
                    leadingIcon: FontAwesomeIcons.solidCreditCard,
                    title: "MyCards",
                    showDivider: false,
                    onTap: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
