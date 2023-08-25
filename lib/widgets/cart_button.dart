import 'package:flutter/material.dart';

import '../util/app_colors.dart';
import 'app_icon.dart';
import 'big_text.dart';

class CartButton extends StatelessWidget {
  final int totalItems;
  const CartButton({super.key, required this.totalItems});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppIcon(icon: Icons.shopping_cart_outlined),
        totalItems >= 1
            ? Positioned(
                top: 0,
                right: 0,
                child: AppIcon(
                  icon: Icons.circle,
                  size: 20,
                  iconColor: Colors.transparent,
                  backgroundColor: AppColors.mainColor,
                ),
              )
            : Container(),
        totalItems >= 1
            ? Positioned(
                top: 3,
                right: 6,
                child: BigText(
                  text: totalItems.toString(),
                  color: Colors.white,
                  size: 12,
                ),
              )
            : Container(),
      ],
    );
  }
}
