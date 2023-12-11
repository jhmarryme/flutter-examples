import 'package:flutter/material.dart';
import 'package:test_in_action/common/constants/colors.dart';
import 'package:test_in_action/common/constants/style.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    required this.leadingIcon,
    required this.title,
    this.showDivider = true,
    this.onTap,
  }) : super(key: key);

  final IconData leadingIcon;
  final String title;
  final bool? showDivider;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(leadingIcon, color: ColorStyle.kGrey400),
          title: Text(title),
          trailing: const Icon(Icons.navigate_next, color: ColorStyle.kGrey400),
          onTap: onTap,
        ),
        if (showDivider ?? false) DividerStyle.divider1Half,
      ],
    );
  }
}
