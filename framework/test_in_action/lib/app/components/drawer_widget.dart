import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/routes/backup/app_pages.dart';
import 'package:test_in_action/services/auth_service.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.red,
          ),
          ListTile(
            title: const Text('To DataTable2 View'),
            onTap: () {
              Get.toNamed(Routes.dataTable);
              //to close the drawer

              // Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('dataGrid'),
            onTap: () {
              Get.offAndToNamed(Routes.dataGrid);
              //to close the drawer

              // Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('formBuilder'),
            onTap: () {
              Get.offAndToNamed(Routes.formBuilder);
              //to close the drawer

              // Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('charts'),
            onTap: () {
              Get.offAndToNamed(Routes.charts);
              //to close the drawer

              // Navigator.of(context).pop();
            },
          ),
          if (AuthService.to.isLogin)
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onTap: () {
                AuthService.to.logout();
                Get.toNamed(Routes.login);
                //to close the drawer

                Navigator.of(context).pop();
              },
            ),
          if (!AuthService.to.isLogin)
            ListTile(
              title: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.login);
                //to close the drawer

                Navigator.of(context).pop();
              },
            ),
        ],
      ),
    );
  }
}
