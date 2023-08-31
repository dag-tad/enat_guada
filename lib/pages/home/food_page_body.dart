import 'package:dots_indicator/dots_indicator.dart';
import 'package:enat_guada/controller/popular_product_controller.dart';
import 'package:enat_guada/pages/food/popular_food_detail.dart';
import 'package:enat_guada/routes/route_helper.dart';
import 'package:enat_guada/util/app_colors.dart';
import 'package:enat_guada/util/app_constants.dart';
import 'package:enat_guada/util/dimentions.dart';
import 'package:enat_guada/widgets/big_text.dart';
import 'package:enat_guada/widgets/icon_and_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../controller/recommended_product_controller.dart';
import '../../models/products_model.dart';
import '../../widgets/food_item_card.dart';
import '../../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _height = Dimensions.pageViewContainer;

  late int numberOfProducts = 0;
  var _currentPageValue = 0.0;
  var _scaleFactor = 0.8;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void disppse() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(
                          position,
                          popularProducts.popularProductList[position],
                        );
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? DotsIndicator(
                  dotsCount: popularProducts.popularProductList.length,
                  position: _currentPageValue,
                  decorator: DotsDecorator(
                    activeColor: AppColors.mainColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
            margin: EdgeInsets.only(
              left: Dimensions.width30,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Recommended"),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: BigText(text: ".", color: Colors.black26)),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(
                    text: "Food pairing",
                  ),
                )
              ],
            )),
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood(index, "home"));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height10),
                        child: Row(children: [
                          Container(
                            width: Dimensions.listViewImgSize,
                            height: Dimensions.listViewImgSize,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white38,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URI}/${recommendedProduct.recommendedProductList[index].img}"))),
                          ),
                          Expanded(
                            child: Container(
                                height: Dimensions.listViewTextContentSize,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                          Radius.circular(Dimensions.radius20),
                                    )),
                                padding: EdgeInsets.only(
                                  left: Dimensions.width10,
                                  right: Dimensions.width10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                        text: recommendedProduct
                                            .recommendedProductList[index]
                                            .name),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    SmallText(
                                      text: "Withe Chinese Charactoristics",
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    Row(
                                      children: [
                                        IconAndTextWidget(
                                            text: 'Normal',
                                            icon: Icons.circle_sharp,
                                            iconColor: AppColors.iconColor1),
                                        IconAndTextWidget(
                                            text: '1.7km',
                                            icon: Icons.location_on,
                                            iconColor: AppColors.mainColor),
                                        IconAndTextWidget(
                                            text: '32min',
                                            icon: Icons.access_time_rounded,
                                            iconColor: AppColors.iconColor2),
                                      ],
                                    )
                                  ],
                                )),
                          )
                        ]),
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel product) {
    Matrix4 matrix4 = Matrix4.identity();
    final String img = product.img!;
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var _currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix4,
      child: GestureDetector(
        onTap: () {
          // Get.toNamed(RouteHelper.getPopularFood(index, "home"));
        },
        child: Stack(
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(RouteHelper.getPopularFood(index, "home"));
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10,
                ),
                height: Dimensions.pageViewContainer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index.isEven ? Color(0xFF69C5DF) : Color(0xFF9294CC),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URI}/${product.img!}")),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30,
                ),
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.font20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFE8E8E8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                      BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                    ]),
                child: Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      left: Dimensions.height15,
                      right: Dimensions.height15,
                    ),
                    child: FoodItemCard(
                      text: product.name!,
                      rating: double.parse((product.stars!).toString()),
                      comments: 1287,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
