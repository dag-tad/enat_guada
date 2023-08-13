import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageView = Get.context!.height / 2.64;

  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.20;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.75;
  static double height55 = screenHeight / 16.02;

  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.75;
 
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  static double iconSize16 = screenHeight / 52.75;
  static double iconSize24 = screenHeight / 35.17;

  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContentSize = screenWidth / 3.9;

  static double popularFoodImgSize = screenHeight / 2.41;

  static double bottomHeightBar = screenHeight / 7.03;
}