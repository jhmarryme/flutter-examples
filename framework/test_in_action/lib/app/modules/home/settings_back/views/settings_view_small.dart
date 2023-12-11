import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/my_dorpdown_widget.dart';
import 'package:test_in_action/app/modules/home/settings/settings_logic.dart';
import 'package:test_in_action/app/routes/backup/app_pages.dart';
import 'package:test_in_action/common/constants/style.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';

class SettingsViewSmall extends GetView<SettingsLogic> {
  SettingsViewSmall({Key? key}) : super(key: key);

  final TextStyle headerStyle = TextStyle(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    final state = controller.state;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Settings'),
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
                    title: const Text("Damodar Lohani"),
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
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: ListTile(
                leading: const Icon(Icons.accessible_forward),
                title: const Text("test"),
                onTap: () {
                  controller.pushPage2(Routes.nestPage);
                  // Get.offNamed(Routes.welcome);
                  // Get.offNamed("test");
                  // Get.offNamed(Routes.dataTable);
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Logout"),
                onTap: () {
                  controller.pushPage(Routes.index);
                  // Get.offNamed(Routes.welcome);
                  // Get.offNamed("test");
                  // Get.offNamed(Routes.dataTable);
                },
              ),
            ),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }
}
