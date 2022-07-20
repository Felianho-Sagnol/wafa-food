import 'package:get/get.dart';
import 'package:wafaeats/app/data/models/product/product.category.model.dart';
import 'package:wafaeats/app/data/models/product/product.model.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();

  ProductController() {
    initProducts();
  }

  var products = <Product>[].obs;
  var favorites = <Product>[].obs;
  var categories = <ProductCategory>[].obs;

  void initProducts() {
    products.value = productList;
    favorites.value = favoritesList;
    categories.value = categoriesList;
  }

  Product? getProduct(int id) {
    for (Product p in products) {
      if (p.id == id) return p;
    }
    return null;
  }
}

var productList = <Product>[
  Product(
    id: 1,
    name: "Riz",
    price: 12,
    url: "assets/images/burger.png",
    description:
        "Une longue description du villagge hg sdg dsfg fhg gf gghdsds fdsggfsd ggsd sdffgd sgsdfdshfds dsgfd sdsgf sdg sdfghsq f dfgsdsd fds f",
  ),
  Product(
    id: 2,
    name: "Tacos au poulet",
    price: 35,
    url: "assets/images/burger1.jpg",
  ),
  Product(
    id: 3,
    name: "Burger",
    price: 19.7,
    url: "assets/images/tacos.png",
  ),
  Product(
    id: 4,
    name: "KFC",
    price: 10,
    url: "assets/images/sandwich.png",
  ),
  Product(
    id: 5,
    name: "Tacos à la viande hachée chez mr mohameh",
    price: 17,
    url: "assets/images/tacos.png",
  ),
  Product(
    id: 6,
    name: "Glaces",
    price: 20.0,
    url: "assets/images/glaces.png",
  ),
  Product(
    id: 7,
    name: "Pizza",
    price: 25.0,
    url: "assets/images/pizza.png",
  ),
];

var favoritesList = <Product>[
  Product(
    id: 1,
    name: "Riz",
    price: 12,
    url: "assets/images/burger.png",
  ),
  Product(
    id: 2,
    name: "Tacos au poulet",
    price: 35,
    url: "assets/images/burger1.jpg",
  ),
  Product(
    id: 3,
    name: "Burger",
    price: 19.7,
    url: "assets/images/tacos.png",
  ),
  Product(
    id: 4,
    name: "KFC",
    price: 10,
    url: "assets/images/sandwich.png",
  ),
  Product(
    id: 5,
    name: "Tacos à la viande hachée chez mr mohameh",
    price: 17,
    url: "assets/images/tacos.png",
  ),
  Product(
    id: 6,
    name: "Glaces",
    price: 20.0,
    url: "assets/images/glaces.png",
  ),
  Product(
    id: 7,
    name: "Pizza",
    price: 25.0,
    url: "assets/images/pizza.png",
  ),
];

var categoriesList = <ProductCategory>[
  ProductCategory(
    id: 1,
    title: "Burger",
    imageurl: "assets/images/burger.png",
  ),
  ProductCategory(
    id: 2,
    title: "Tacos au poulet",
    imageurl: "assets/images/burger1.jpg",
  ),
  ProductCategory(
    id: 3,
    title: "Végétales",
    imageurl: "assets/images/tacos.png",
  ),
  ProductCategory(
    id: 4,
    title: "Pizzas",
    imageurl: "assets/images/pizza.png",
  ),
  ProductCategory(
    id: 5,
    title: "Sandwich",
    imageurl: "assets/images/sandwich.png",
  ),
];
