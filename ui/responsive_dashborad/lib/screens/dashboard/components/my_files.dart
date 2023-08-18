import 'package:flutter/material.dart';
import 'package:responsive_dashboard/constants.dart';
import 'package:responsive_dashboard/models/MyFiles.dart';
import 'package:responsive_dashboard/screens/dashboard/components/file_info_card.dart';
import 'package:responsive_dashboard/widgets/responsive/responsive_helper.dart'
    as responsive;

class MyFiles extends StatelessWidget {
  const MyFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add New"),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        responsive.WidgetBuilder(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
          tablet: FileInfoCardGridView(
            crossAxisCount: 3,
          ),
        )
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  const FileInfoCardGridView(
      {super.key, this.crossAxisCount = 4, this.childAspectRatio = 1});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPaddingW,
        mainAxisSpacing: defaultPaddingW,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
