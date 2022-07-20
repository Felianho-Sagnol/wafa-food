import 'package:get/get.dart';

class CategoriesController extends GetxController {
  static CategoriesController get to => Get.find();
  var currentSelectedId = 0.obs;
  var currentSelectedTitle = "".obs;
}
