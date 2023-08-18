import 'package:flutter/material.dart';
import 'package:ui_challenges/models/menu.dart' as menu;
import 'package:ui_challenges/pages/profile/profile1.dart';
import 'package:ui_challenges/pages/profile/profile1_origin.dart';
import 'package:ui_challenges/pages/profile/profile2.dart';
import 'package:ui_challenges/pages/profile/profile2_origin.dart';
import 'package:ui_challenges/pages/profile/profile8.dart';

List<menu.MenuItem> pages = [
  menu.MenuItem(title: "Profile", icon: Icons.person, items: [
    menu.SubMenuItem("Profile One", const ProfileOnePage(),
        path: ProfileOnePage.path),
    menu.SubMenuItem("Profile One Origin", const ProfileOneOriginPage(),
        path: ProfileOneOriginPage.path),
    menu.SubMenuItem("Profile Two", const ProfileTwoPage(),
        path: ProfileTwoPage.path),
    menu.SubMenuItem("Profile Two Origin", ProfileTwoOriginPage(),
        path: ProfileTwoOriginPage.path),
    menu.SubMenuItem("Profile Eight", const ProfileEightPage(),
        path: ProfileEightPage.path),
  ]),
];
