import 'dart:async';

import 'package:enat_guada/routes/route_helper.dart';
import 'package:enat_guada/util/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../controller/popular_product_controller.dart';
import '../../controller/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;

  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();
    animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    Timer(const Duration(seconds: 3), () => Get.offNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/image/splash_screen_img.jpg",
                width: Dimensions.splashImg,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/image/splash_screen_text.jpg",
              width: 250,
            ),
          ),
        ],
      ),
    );
  }
}
