import 'package:enat_guada/controller/recommended_product_controller.dart';
import 'package:enat_guada/routes/route_helper.dart';
import 'package:flutter/material.dart';

import 'package:enat_guada/widgets/app_icon.dart';
import 'package:enat_guada/widgets/expandable_text.dart';
import 'package:get/get.dart';
import '../../util/app_colors.dart';
import '../../util/app_constants.dart';
import '../../util/dimentions.dart';
import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final String productId;
  const RecommendedFoodDetail({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[int.parse(productId)];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.initial);
                    },
                    child: AppIcon(
                      icon: Icons.clear,
                    )),
                AppIcon(icon: Icons.shopping_cart)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child: BigText(
                    text: product.name!,
                    size: Dimensions.font26,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    )),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network("${AppConstants.BASE_URL}${AppConstants.UPLOAD_URI}/${product.img}"),
            ),
          ),
          SliverToBoxAdapter(
              child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: ExpandableText(text: product.description!)),
            ]),
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20 * 2.5,
              vertical: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                  text: "\$${product.price}  X  0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.height30,
              horizontal: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height20 - 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Icon(Icons.favorite, color: AppColors.mainColor),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.height20 - 1,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                  child:
                      BigText(text: "\$28 | Add to cart", color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
