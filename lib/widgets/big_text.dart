import 'package:flutter/material.dart';

import '../util/dimentions.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? color;
  final IconData? icon;
  double size;
  TextOverflow overflow;
  BigText(
      {super.key,
      required this.text,
      this.color = const Color(0xFF332D2B),
      this.icon,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
