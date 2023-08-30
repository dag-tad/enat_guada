import 'package:enat_guada/controller/popular_product_controller.dart';
import 'package:enat_guada/pages/cart/cart_page.dart';
import 'package:enat_guada/pages/food/recommended_food_detail.dart';
import 'package:enat_guada/pages/home/food_page_body.dart';
import 'package:enat_guada/pages/home/main_food_page.dart';
import 'package:enat_guada/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:enat_guada/helper/dependencies.dart' as dep;

import 'controller/recommended_product_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: MainFoodPage(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterApp',
      home: const MainFoodPage()
    );
  }
}
