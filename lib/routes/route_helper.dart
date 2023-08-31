import 'package:enat_guada/pages/food/popular_food_detail.dart';
import 'package:enat_guada/pages/food/recommended_food_detail.dart';
import 'package:enat_guada/pages/home/home_page.dart';
import 'package:enat_guada/pages/home/main_food_page.dart';
import 'package:enat_guada/pages/splash/splash_page.dart';
import 'package:get/get.dart';

import '../pages/cart/cart_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splashPage = "/splash-page";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/Recommended-food";
  static const String cartPage = "/cart-page";

  static String getInitial() => initial;
  static String getSplashPage() => splashPage;
  static String getPopularFood(int productId, String page) => "$popularFood?productId=$productId&page=$page";
  static String getRecommendedFood(int productId, String page) => "$recommendedFood?productId=$productId&page=$page";
  static String getCartPage() => cartPage;

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var productId = Get.parameters['productId'];
          var page = Get.parameters['page'];

          return PopularFoodDetail(productId: productId!, page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
      name: recommendedFood,
      page: () {
          var productId = Get.parameters['productId'];
          var page = Get.parameters['page'];

        return RecommendedFoodDetail(productId: productId!, page: page!);
        },
      transition: Transition.fadeIn
    ),
    GetPage(name: cartPage, page: () => CartPage(), transition: Transition.fadeIn)
  ];
}
