import 'package:get/get.dart';
import 'package:wafaeats/app/controllers/products/product.controller.dart';
import 'package:wafaeats/app/data/models/product/product.model.dart';
import 'package:wafaeats/app/modules/widgets/dialog/delete.dialog.dart';
import 'package:wafaeats/app/modules/widgets/snackbar/product.snackbar.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  var products = {}.obs;
  var totalPrice = 0.0.obs;

  Future<void> addProduct(int id) async {
    if (products.containsKey(id)) {
      products[id]["quantity"] += 1;
    } else {
      Product? p = await ProductController.to.getProduct(id);
      if (p != null) {
        var item = {};
        item["quantity"] = 1;
        item["product"] = p;
        products[id] = item;
        ProductSnackBar.addedSuccessfulySnackbar("Produit ajoué avec succès.");
      }
    }
    await calculateTotal();
  }

  Future<void> deleteProduct(int id) async {
    if (products.containsKey(id)) {
      if (products[id]["quantity"] == 1) {
        Dialog.showDeleteDialog(id, products[id]["product"].name);
      } else {
        products[id]["quantity"] -= 1;
      }
      await calculateTotal();
    }
  }

  Future calculateTotal() async {
    double totale = 0.0;
    for (int id in products.keys) {
      var item = products[id];
      totale += item["product"].price * item["quantity"];
    }
    totalPrice.value = totale;
    update();
  }

  Future deletFromCart(int id) async {
    products.removeWhere((key, value) => key == id);
    ProductSnackBar.deleteProductSnackbar(
      "Suppression effectuée avec succès.",
    );
    await calculateTotal();
  }

  bool productExist(int id) {
    return products.containsKey(id);
  }

  int getProductQuantity(int id) {
    int qty = 0;
    if (!products.containsKey(id)) return qty;
    qty = products[id]["quantity"];

    return qty;
  }

  Future<int> modifyProductAndGetQuantity(int id, {int action = 1}) async {
    int qty = 0;
    if (action == 1) {
      //add
      if (products.containsKey(id)) {
        products[id]["quantity"] += 1;
        qty = products[id]["quantity"];
        await calculateTotal();
      }
    } else {
      //decrease
      if (products.containsKey(id)) {
        if (products[id]["quantity"] == 1) {
          products.removeWhere((key, value) => key == id);
          qty = 0;
        } else {
          products[id]["quantity"] -= 1;
          qty = products[id]["quantity"];
        }
        await calculateTotal();
      }
    }

    return qty;
  }
}
