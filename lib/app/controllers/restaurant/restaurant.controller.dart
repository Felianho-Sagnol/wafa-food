import 'package:get/get.dart';
import 'package:wafaeats/app/data/models/restaurent/restaurant.model.dart';

class RestaurantController extends GetxController {
  var restaurants = <Restaurant>[].obs;
  var searchedRestaurants = <Restaurant>[].obs;

  static RestaurantController get to => Get.find();

  RestaurantController() {
    initRestaurants();
  }

  void initRestaurants() {
    restaurants.value = restaurantList;
  }

  List<Restaurant> getPopularRestaurants() {
    List<Restaurant> populars = <Restaurant>[];
    for (Restaurant r in restaurants) {
      if (r.isPopular!) {
        populars.add(r);
      }
    }

    return populars;
  }

  List<Restaurant> getSearchedRestaurants(String query) {
    List<Restaurant> searched = <Restaurant>[];
    for (Restaurant r in restaurants) {
      if (r.name
          .toLowerCase()
          .contains(query.toLowerCase().removeAllWhitespace)) {
        searched.add(r);
      }
    }

    return searched;
  }
}

final restaurantList = <Restaurant>[
  Restaurant(
    id: 1,
    name: "Burger lab",
    minPrice: 45,
    imageUrl: "assets/images/burger.png",
    rating: 3.4,
    distance: 14.2,
  ),
  Restaurant(
    id: 2,
    isPopular: true,
    name: "SAGNO RESTO",
    minPrice: 100,
    imageUrl: "assets/images/burger1.jpg",
    rating: 3.7,
    distance: 14.2,
  ),
  Restaurant(
    id: 3,
    name: "Peell's pizza",
    minPrice: 78,
    imageUrl: "assets/images/pizza.png",
    rating: 2.0,
    distance: 41.2,
  ),
  Restaurant(
    id: 4,
    name: "Sandwich Restaurant",
    minPrice: 5,
    imageUrl: "assets/images/sandwich.png",
    rating: 5.0,
    distance: 54.2,
  ),
  Restaurant(
    id: 5,
    isPopular: true,
    name: "Tacos",
    minPrice: 10,
    imageUrl: "assets/images/burger.png",
    rating: 2.5,
    distance: 7.2,
  ),
  Restaurant(
    id: 6,
    name: "Sushi restao",
    minPrice: 17,
    imageUrl: "assets/images/burger.png",
    rating: 5,
    distance: 16.2,
  ),
  Restaurant(
    id: 7,
    isPopular: true,
    name: "Tacos +",
    minPrice: 18.0,
    imageUrl: "assets/images/tacos.png",
    rating: 5,
    distance: 20.2,
    description:
        "Nous sommes un resto de livraison de tacos partout dans le monde .",
  ),
];
