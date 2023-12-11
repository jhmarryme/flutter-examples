import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:test_in_action/app/components/my_dorpdown_widget.dart';
import 'package:test_in_action/app/modules/profile/settings/settings_logic.dart';
import 'package:test_in_action/app/modules/root/root_logic.dart';
import 'package:test_in_action/common/constants/style.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';
import 'package:test_in_action/services/global_service.dart';

class SettingsView extends GetView<SettingsLogic> {
  SettingsView({Key? key}) : super(key: key);
  final TextStyle headerStyle = TextStyle(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<SettingsLogic>(() => SettingsLogic());
    Get.lazyPut<GlobalService>(() => GlobalService());
    final rootLogic = Get.find<RootLogic>();
    final state = controller.state;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 25.r),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("ACCOUNT", style: headerStyle),
            const SizedBox(height: 10.0),
            Card(
              elevation: 0.5,
              margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/dev/avatars/avatar.jpeg")),
                    title: const Text("Kuria Maindo"),
                    onTap: () {},
                  ),
                  DividerStyle.divider1Half,
                  SwitchListTile(
                    activeColor: Colors.purple,
                    value: true,
                    title: const Text("Private Account"),
                    onChanged: (val) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Text("PUSH NOTIFICATIONS", style: headerStyle),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    activeColor: Colors.purple,
                    value: true,
                    title: const Text("Received notification"),
                    onChanged: (val) {},
                  ),
                  DividerStyle.divider1Half,
                  Obx(() {
                    return ListTile(
                      leading: Text(LanguageStrings.language.tr),
                      trailing: MyDropdownWidget<String>(
                        map: state.languageMaps,
                        selectedValue: state.languageSelectedValue.value,
                        onChanged: (value) => controller.changeLanguage(value),
                      ),
                    );
                  }),
                  DividerStyle.divider1Half,
                  Obx(() {
                    return ListTile(
                      leading: Text(ThemeStrings.themeMode.tr),
                      trailing: MyDropdownWidget<String>(
                        map: state.themeMaps,
                        selectedValue: state.themeSelectedValue.value,
                        onChanged: (value) => controller.changeTheme(value),
                      ),
                    );
                  }),
                  DividerStyle.divider1Half,
                  SwitchListTile(
                    activeColor: Colors.purple,
                    value: true,
                    title: const Text("Received Offer Notification"),
                    onChanged: (val) {},
                  ),
                  DividerStyle.divider1Half,
                  const SwitchListTile(
                    activeColor: Colors.purple,
                    value: true,
                    title: Text("Received App Updates"),
                    onChanged: null,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () => GoRouter.of(context).go("/profile/blank"),
                child: const Text("/profle/blank")),
            Card(
              child: Obx(() {
                return ListTile(
                  leading: const Text("To Route"),
                  trailing: MyDropdownWidget<String>(
                    map: state.routeMaps,
                    selectedValue: state.routeSelectedValue.value,
                    onChanged: (value) {
                      if (value != null && "null" != value) {
                        state.routeSelectedValue.value = value;
                        GoRouter.of(context).goNamed(value);
                      }
                    },
                  ),
                );
              }),
            ),
            Card(
              child: ListTile(
                leading: const Text("Logout"),
                trailing: ElevatedButton(
                  onPressed: () => rootLogic.logout(),
                  child: Icon(Icons.exit_to_app),
                ),
              ),
            ),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }
}
