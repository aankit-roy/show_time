
import 'package:flutter/material.dart';
import 'package:show_time/res/constants/app_color.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
        required this.icon,
        required this.title,
        this.iconSize = 25,
        this.textSize = 18,
        this.letterSpacingtext = 0});
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final double letterSpacingtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.white,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
            letterSpacing: letterSpacingtext,
            color: AppColors.lightGray
          ),
        )
      ],
    );
  }
}
