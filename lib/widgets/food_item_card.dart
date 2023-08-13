import 'package:enat_guada/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../util/app_colors.dart';
import '../util/dimentions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class FoodItemCard extends StatelessWidget {
  final String text;
  final double rating;
  final int comments;
  final double titleFontSize;

  const FoodItemCard({super.key, required this.text, this.rating = 0.0, this.comments = 0, this.titleFontSize = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: text,
                      size: titleFontSize,
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
                        SmallText(text: rating.toString()),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        SmallText(text: comments.toString()),
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
                );
  }
}