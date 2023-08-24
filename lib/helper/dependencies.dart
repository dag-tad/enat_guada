import 'package:enat_guada/controller/cart_controller.dart';
import 'package:enat_guada/controller/popular_product_controller.dart';
import 'package:get/get.dart';

import '../controller/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';
import '../util/app_constants.dart';

Future<void> init() async {
  Get.lazyPut(() =>  ApiClient(appBaseUrl: AppConstants.BASE_URL));
  
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}