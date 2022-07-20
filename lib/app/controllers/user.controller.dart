import 'package:get/get.dart';
import 'package:wafaeats/app/data/models/user.model.dart';

//getx model state https://github.com/jonataslaw/getx/blob/master/documentation/en_US/state_management.md

class UserController extends GetxController {
  static UserController get to => Get.find();

  final user = User().obs;

  void setUser(User u) {
    user.value = u;
    //update();
  }
}
