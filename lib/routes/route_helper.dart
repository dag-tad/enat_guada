import 'package:enat_guada/pages/food/popular_food_detail.dart';
import 'package:enat_guada/pages/food/recommended_food_detail.dart';
import 'package:enat_guada/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/Recommended-food";

  static String getInitial() => "$initial";
  static String getPopularFood(int productId) => "$popularFood?productId=$productId";
  static String getRecommendedFood(int productId) => "$recommendedFood?productId=$productId";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var productId = Get.parameters['productId'];
          
          return PopularFoodDetail(productId: productId!);
        },
        transition: Transition.fadeIn),
    GetPage(
      name: recommendedFood,
      page: () {
          var productId = Get.parameters['productId'];

        return RecommendedFoodDetail(productId: productId!);
        },
      transition: Transition.fadeIn
    )
  ];
}
