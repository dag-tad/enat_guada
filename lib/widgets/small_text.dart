import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  final IconData? icon;
  double size;
  double height;
  SmallText(
      {super.key,
      required this.text,
      this.color = const Color(0xFFCCC7C5),
      this.icon,
      this.size = 12,
      this.height = 1.2
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Roboto',
        height: height
      ),
    );
  }
}
