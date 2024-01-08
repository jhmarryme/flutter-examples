import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class GetBuilderView<P extends GetxController>
    extends StatelessWidget {
  const GetBuilderView({super.key});

  final String? tag = null;

  P get controller {
    return Get.find<P>(tag: tag);
  }

  get updateId => null;

  get lifecycle => null;

  void beforeBuild();

  Widget doBuild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    // 可以在这里初始化getxController
    beforeBuild();
    return GetBuilder<P>(
      id: updateId,
      tag: tag,
      builder: (controller) {
        return doBuild(context);
      },
    );
  }
}
