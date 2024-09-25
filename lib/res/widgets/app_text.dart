import 'package:flutter/material.dart';
import 'package:show_time/res/constants/app_color.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;

  // Constructor with required text and size, optional color
  AppText({
    required this.text,
    required this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color ?? AppColors.white, // Default color is white if not provided
      ),
    );
  }
}