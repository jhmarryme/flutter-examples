import 'package:flutter/material.dart';
import 'package:responsive_dashboard/constants.dart';
import 'package:responsive_dashboard/screens/dashboard/components/recent_files.dart';

import '../../widgets/responsive/responsive_helper.dart' as responsive;
import 'components/header.dart';
import 'components/my_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        // primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        MyFiles(),
                        SizedBox(height: defaultPadding),
                        RecentFiles(),
                        if (responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (responsive.isMobile(context)) StorageDetails()
                      ],
                    )),
                if (!responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                if (!responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
