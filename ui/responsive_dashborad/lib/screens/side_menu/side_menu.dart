import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Image.asset('assets/images/logo.png')),
          const DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
          ),
          const DrawerListTile(
            title: "Transaction",
            svgSrc: "assets/icons/menu_tran.svg",
          ),
          const DrawerListTile(
            title: "Task",
            svgSrc: "assets/icons/menu_task.svg",
          ),
          const DrawerListTile(
            title: "Documents",
            svgSrc: "assets/icons/menu_doc.svg",
          ),
          const DrawerListTile(
            title: "Store",
            svgSrc: "assets/icons/menu_store.svg",
          ),
          const DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
          ),
          const DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
          ),
          const DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title, svgSrc;
  final GestureTapCallback? press;

  const DrawerListTile({
    super.key,
    required this.title,
    required this.svgSrc,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press ?? () {},
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(title, style: TextStyle(color: Colors.white54)),
    );
  }
}
