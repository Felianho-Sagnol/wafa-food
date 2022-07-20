
import 'package:get/get.dart';
import 'package:wafaeats/app/controllers/auth.controller.dart';
import 'package:wafaeats/app/controllers/bottom.nav.controller.dart';
import 'package:wafaeats/app/controllers/categories.controller.dart';
import 'package:wafaeats/app/controllers/curvnav.controller.dart';
import 'package:wafaeats/app/controllers/home.controller.dart';
import 'package:wafaeats/app/controllers/products/cart.controller.dart';
import 'package:wafaeats/app/controllers/products/product.controller.dart';
import 'package:wafaeats/app/controllers/restaurant/restaurant.controller.dart';
import 'package:wafaeats/app/controllers/user.controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(CurvNavController());
    Get.put(UserController());
    Get.put(ProductController());
    Get.put(CartController());
    Get.put(BottomNavController());
    Get.put(CategoriesController());
    Get.put(AuthController());
    Get.put(RestaurantController());
  }
}
