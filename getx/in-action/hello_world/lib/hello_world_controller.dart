import 'package:get/get.dart';

class HelloWorldController extends GetxController {
  var count = 0.obs;

  increment() => count++;
}
