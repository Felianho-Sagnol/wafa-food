import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  var isAuthenticated = false.obs;

  setIsAuthenticated(bool value) {
    isAuthenticated.value = value;
  }
}
