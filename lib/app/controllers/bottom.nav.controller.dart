import 'package:get/get.dart';

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();
  var currentIndex = 0.obs;
  var previousIndex = 0.obs;
}
