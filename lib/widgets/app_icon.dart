import 'package:flutter/material.dart';

import '../util/dimentions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  AppIcon({super.key, required this.icon, this.backgroundColor = const Color(0xFFFCF4E4),
  this.iconColor = const Color(0xFF756D54), this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize16
      ),
    );
  }
}