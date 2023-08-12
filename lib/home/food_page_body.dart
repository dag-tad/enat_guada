import 'package:dots_indicator/dots_indicator.dart';
import 'package:enat_guada/util/app_colors.dart';
import 'package:enat_guada/util/dimentions.dart';
import 'package:enat_guada/widgets/big_text.dart';
import 'package:enat_guada/widgets/icon_and_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _height = Dimensions.pageViewContainer;

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
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
                BigText(text: "Popular"),
                SizedBox(width: Dimensions.width10,),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(text: ".", color: Colors.black26)
                ),
                SizedBox(width: Dimensions.width10,),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: "Food pairing",),
                )
              ],
            )
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();

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
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: Dimensions.width10,
            ),
            height: Dimensions.pageViewContainer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Color(0xFF69C5DF) : Color(0xFF9294CC),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/food0.jpg')),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Chinese Side',
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) =>
                                  Icon(Icons.star, color: AppColors.mainColor)),
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        SmallText(text: '4.5'),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        SmallText(text: "1287"),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        SmallText(text: "comments"),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
